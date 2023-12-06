<template>
  <div class="box">
    <el-page-header @back="$router.back()"
                    style="margin-bottom:30px"></el-page-header>
    <el-row>
      <el-col :offset="2"
              :span="20">
        <div v-for="(item, index) in questionList"
             :key="index">
          <el-card style="margin:10px">
            <div slot="header">
              <span>第{{index+1}}题</span>
              <el-tag style="float: right;"> {{item.score}}分</el-tag>
              <el-tag style="float: right;margin-right:30px">{{item.type}}</el-tag>
            </div>
            <div v-if="item.type === '单选'">
              <single-choice :question="item"
                             v-model="item.myAnswer"></single-choice>
            </div>
            <div v-if="item.type === '多选'">
              <multiple-choice :question="item"
                               v-model="item.myAnswer"></multiple-choice>
            </div>
            <div v-if="item.type === '判断'">
              <true-false :question="item"
                          v-model="item.myAnswer"></true-false>
            </div>
            <div v-if="item.type === '简答'">
              <short-answer :question="item"
                            v-model="item.myAnswer"></short-answer>
            </div>
          </el-card>
        </div>

        <el-button type="info"
                   style="float: right;margin: 20px;"
                   @click="  $router.back()">返回上一页</el-button>
        <el-button type="success"
                   style="float: right;margin: 20px;"
                   @click="submitForm">提交</el-button>
      </el-col>

    </el-row>

  </div>
</template>


<script>
import SingleChoice from './type/SingleChoice.vue'
import MultipleChoice from './type/MultipleChoice.vue'
import TrueFalse from './type/TrueFalse.vue'
import ShortAnswer from './type/ShortAnswer.vue'
export default {
  components: { MultipleChoice, SingleChoice, TrueFalse, ShortAnswer, TrueFalse, },
  computed: {},
  data () {
    return {
      question: {
        singleChoice: [],
        multipleChoice: [],
        trueFalse: [],
        shortAnswer: []
      },
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
      userId: null,
    }
  },
  mounted () {
    this.examId = this.$route.query.examId
    this.userId = this.$route.query.userId
    this.getExam()
    this.getQuestion()
  },
  methods: {
    submitForm () {
      this.axios.post(`/exam/userpaper/submitScore?examId=${this.examId}&userId=${this.userId}`, this.questionList).then(data => {
      }).catch(e => { })
    },
    getQuestion () {
      this.axios.post(`/exam/userpaper/checkQuestion?examId=${this.examId}&userId=${this.userId}`).then(data => {
        this.question = data
        this.present = this.question.singleChoice[0]
        this.questionList = [...this.question.singleChoice, ...this.question.multipleChoice, ...this.question.trueFalse, ...this.question.shortAnswer]
      }).catch(e => { })
    },
    getExam () {
      this.axios.post(`/exam/userpaper/exam?examId=${this.examId}`).then(data => {
        this.exam = data
      }).catch(e => { })
    },
  },
}

</script>
<style scoped>
.box {
  background: #e5ecf3;
  min-height: 100vh;
  margin: -20px;
}
</style>