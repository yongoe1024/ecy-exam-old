<template>
  <div class="box">
    <el-page-header @back="$router.back()"
                    style="margin-bottom:30px"></el-page-header>
    <el-row>
      <el-col :offset="1"
              :span="20">
        <el-card>
          <div style="font-size: 14px;">及格分: {{exam.examRes.passScore}}</div>
          <div style="font-size: 14px;">试卷总分: {{exam.examRes.totalScore}}</div>
          <el-divider></el-divider>
          <div style="font-size: 14px;">得分: {{exam.score}}</div>

        </el-card>
      </el-col>

      <el-col :offset="1"
              :span="20">
        <div v-for="(item, index) in questionList"
             style="pointer-events: none;"
             :key="index">
          <el-card style="margin-bottom:10px">
            <div slot="header">
              <span>第{{index+1}}题</span>
              <el-tag style="float: right;"> {{item.score}}分</el-tag>
              <el-tag style="float: right;margin-right:30px">{{item.type}}</el-tag>
            </div>
            <div v-if="item.type === '单选'">
              <single-choice :question="item"></single-choice>
            </div>
            <div v-if="item.type === '多选'">
              <multiple-choice :question="item"></multiple-choice>
            </div>
            <div v-if="item.type === '判断'">
              <true-false :question="item"></true-false>
            </div>
            <div v-if="item.type === '简答'">
              <short-answer :question="item"></short-answer>
            </div>
          </el-card>
        </div>
      </el-col>
    </el-row>
  </div>
</template>


<script>
import SingleChoice from './detailsType/SingleChoice.vue'
import MultipleChoice from './detailsType/MultipleChoice.vue'
import TrueFalse from './detailsType/TrueFalse.vue'
import ShortAnswer from './detailsType/ShortAnswer.vue'
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
    }
  },
  mounted () {
    this.examId = this.$route.query.examId
    this.getExam()
    this.getQuestion()
  },
  methods: {
    getQuestion () {
      this.axios.post(`/exam/userpaper/examQuestionInfo?examId=${this.examId}`).then(data => {
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
  margin: -20px;
}
</style>