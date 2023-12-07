<template>
  <div class="box">
    <el-row style="padding:10px;">
      <el-col :offset="1"
              :span="5"
              class="hidden-sm-and-down col">
        <el-row>
          <el-card class="left"
                   v-if="question.singleChoice.length!=0">
            <div slot="header">
              <span>单选</span>
            </div>
            <el-tag effect="dark"
                    :type="i.myAnswer?'success':'info'"
                    class="tag"
                    :class="present.id==i.id?'tagcolor':''"
                    v-for="(i,index) in question.singleChoice"
                    :key="index"
                    @click="clickTag(index)">{{index+1}}</el-tag>
          </el-card>
        </el-row>
        <el-row>
          <el-card class="left"
                   v-if="question.multipleChoice.length!=0">
            <div slot="header">
              <span>多选</span>
            </div>
            <el-tag effect="dark"
                    :type="i.myAnswer?'success':'info'"
                    class="tag"
                    :class="present.id==i.id?'tagcolor':''"
                    v-for="(i,index) in question.multipleChoice"
                    :key="index"
                    @click="clickTag(singleChoiceLength+index)">{{singleChoiceLength+index+1}}</el-tag>
          </el-card>
        </el-row>
        <el-row>
          <el-card class="left"
                   v-if="question.trueFalse.length!=0">
            <div slot="header">
              <span>判断</span>
            </div>
            <el-tag effect="dark"
                    :type="i.myAnswer?'success':'info'"
                    class="tag"
                    :class="present.id==i.id?'tagcolor':''"
                    v-for="(i,index) in question.trueFalse"
                    :key="index"
                    @click="clickTag(singleChoiceLength+multipleChoiceLength+index+index)">{{singleChoiceLength+multipleChoiceLength+index+1}}</el-tag>
          </el-card>
        </el-row>
        <el-row>
          <el-card class="left"
                   v-if="question.shortAnswer.length!=0">
            <div slot="header">
              <span>简答</span>
            </div>
            <el-tag effect="dark"
                    :type="i.myAnswer?'success':'info'"
                    class="tag"
                    :class="present.id==i.id?'tagcolor':''"
                    v-for="(i,index) in question.shortAnswer"
                    :key="index"
                    @click="clickTag(singleChoiceLength+multipleChoiceLength+trueFalseLength+index)">{{singleChoiceLength+multipleChoiceLength+trueFalseLength+index+1}}</el-tag>
          </el-card>
        </el-row>
      </el-col>

      <el-col :sm="24"
              :md="12"
              class="col">
        <el-card>
          <div slot="header">
            <span>题目分值：{{present.score}}</span>
          </div>
          <div>
            <single-choice v-if="present.type=='单选'"
                           :question="present"
                           v-model="present.myAnswer"></single-choice>
            <multiple-choice v-else-if="present.type=='多选'"
                             v-model="present.myAnswer"
                             :question="present"> </multiple-choice>
            <true-false v-else-if="present.type=='判断'"
                        v-model="present.myAnswer"
                        :question="present"> </true-false>
            <short-answer v-else-if="present.type=='简答'"
                          v-model="present.myAnswer"
                          :question="present"> </short-answer>
          </div>

          <div style="float:right;margin:10px;">
            <el-button type="primary"
                       round
                       size="medium"
                       @click="last">上一题</el-button>
            <el-button type="primary"
                       round
                       size="medium"
                       @click="next">下一题</el-button>
          </div>
        </el-card>

      </el-col>
      <el-col :span="5"
              class="hidden-sm-and-down col">
        <el-card>
          <h3>{{exam.examRes.examName}}</h3>
          <div style="font-size: 14px;">及格分: {{exam.examRes.passScore}}</div>
          <div style="font-size: 14px;">试卷总分: {{exam.examRes.totalScore}}</div>
          <div style="font-size: 14px;">考试时间: {{exam.examRes.duration}}分钟</div>
          <el-divider></el-divider>
          <div style="width: 100%; display: inline-block; "
               v-if="deadlineEnable">
            <el-statistic :value="deadline"
                          time-indices
                          title="剩余时间"
                          @finish="finish"
                          format="HH:mm:ss">
            </el-statistic>
          </div>
          <el-divider></el-divider>
          <div v-if="deadlineEnable"
               style=" display: flex;justify-content: center;">
            <el-button type="primary"
                       round
                       size="medium"
                       @click="handPaper">交卷</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>


<script>
import 'element-ui/lib/theme-chalk/display.css'
import "./disable.js"
import SingleChoice from './examType/SingleChoice.vue'
import MultipleChoice from './examType/MultipleChoice.vue'
import TrueFalse from './examType/TrueFalse.vue'
import ShortAnswer from './examType/ShortAnswer.vue'
export default {
  components: { MultipleChoice, SingleChoice, TrueFalse, ShortAnswer, TrueFalse, },
  computed: {},
  watch: {
    present: {
      handler (nv, oldv) {
        if (oldv && oldv.myAnswer) {
          if (this.deadlineEnable) {
            //切换前，如果当前有答案，就提交
            let form = {
              answer: oldv.myAnswer,
              examId: this.examId,
              questionId: oldv.id
            }
            this.axios.post('/exam/userquestion/answer', form).then(data => {
            }).catch(e => { })
          }
        }
      },
    },
  },
  data () {
    return {
      // 当前题目
      present: {
      },
      question: {
        singleChoice: [],
        multipleChoice: [],
        trueFalse: [],
        shortAnswer: []
      },
      singleChoiceLength: 0,
      multipleChoiceLength: 0,
      trueFalseLength: 0,
      shortAnswerLength: 0,
      questionList: [],
      exam: {
        enterTime: '',
        finishTime: '',
        status: '',
        examRes: {
          examName: '',
          passScore: '',
          totalScore: '',
          duration: '',
        }
      },
      examId: null,
      deadline: Date.now() + 1000 * 60 * 60 * 8,
      deadlineEnable: false,
    }
  },
  mounted () {
    this.examId = this.$route.query.examId
    this.getExam()
    this.getQuestion()
  },
  methods: {
    handPaper () {
      //提交最后一道题
      let form = {
        answer: this.present.myAnswer,
        examId: this.examId,
        questionId: this.present.id
      }
      this.axios.post('/exam/userquestion/answer', form).then(data => {
        this.axios.post(`/exam/userpaper/handPaper?examId=${this.examId}`).then(data => {
          this.$confirm('考试结束，是否退出?', '提示', { type: 'warning' }).then(() => {
            window.close()
          }).catch(e => { })
          this.getExam()
        }).catch(e => { })
      }).catch(e => { })
    },
    clickTag (index) {
      this.present = this.questionList[index]
    },
    last () {
      if (this.questionList.indexOf(this.present) - 1 >= 0)
        this.present = this.questionList[this.questionList.indexOf(this.present) - 1]
    },
    next () {
      if (this.questionList.indexOf(this.present) + 1 <= this.questionList.length - 1)
        this.present = this.questionList[this.questionList.indexOf(this.present) + 1]
    },
    finish () {
      this.$message({
        message: '考试时间到',
        type: 'warning'
      })
      this.handPaper()
    },
    getQuestion () {
      this.axios.post(`/exam/userpaper/question?examId=${this.examId}`).then(data => {
        this.question = data
        this.present = this.question.singleChoice[0]
        this.questionList = [...this.question.singleChoice, ...this.question.multipleChoice, ...this.question.trueFalse, ...this.question.shortAnswer]
        this.singleChoiceLength = this.question.singleChoice.length
        this.multipleChoiceLength = this.question.multipleChoice.length
        this.trueFalseLength = this.question.trueFalse.length
        this.shortAnswerLength = this.question.shortAnswer.length
      }).catch(e => { })
    },
    getExam () {
      this.axios.post(`/exam/userpaper/exam?examId=${this.examId}`).then(data => {
        this.exam = data
        //计算倒计时
        let result = ""
        let now = new Date()
        let enterTime = new Date(this.exam.enterTime)
        let endTime = new Date(this.exam.examRes.endTime)
        if (this.exam.enterTime) {
          result = new Date(enterTime.getTime() + 1000 * 60 * this.exam.examRes.duration)
        } else {
          result = new Date(now.getTime() + 3600000)
        }
        if (endTime < now) {
          this.deadline = now
        }
        else if (endTime < result) {
          this.deadline = endTime
        } else {
          this.deadline = result
        }
        this.deadlineEnable = true

        if (this.exam.status == 3 || this.exam.status == 4 || this.exam.status == 5) {
          this.$message({
            message: '考试已结束',
            type: 'warning'
          })
          this.deadlineEnable = false
        }
      }).catch(e => { })
    },
  },
}

</script>
<style scoped>
.box {
  min-height: 100vh;
  background: #eff3f7;
}
.col {
  margin-right: 10px;
}
.left {
  width: 100%;
  margin-bottom: 10px;
}
.tag {
  margin: 5px;
  width: 35px;
  cursor: pointer;
}
.tagcolor {
  background-color: #409eff;
}
</style>