<template>
  <div>
    <el-row>
      <el-col :span="24"
              class="col">
        题目 <div class="ql-editor"
             v-html="question.content"></div>
      </el-col>
    </el-row>

    <div v-for="(item, index) in answerList"
         style="pointer-events: none;"
         :key="index">
      <el-radio v-model="myAnswer"
                class="answer"
                border
                :class="getClass(item)"
                :label="item.id">
        <span>{{`${String.fromCharCode(65+index)}. `}}</span>
        <span class="ql-editor"
              style="display:inline-block;width: 90%;"
              v-html="item.content"></span>
      </el-radio>
    </div>

    <div style="float:right;margin:5px">
      得分：<el-input-number :min="0"
                       :max="question.score"
                       v-model="question.myScore"></el-input-number>
    </div>
  </div>
</template>


<script>
export default {
  props: {
    question: {
      type: Object,
      default: () => {
        return {}
      },
    },
  },
  watch: {
    question: {
      immediate: true,
      handler (nv) {
        if (nv) {
          // 我的答案
          this.myAnswer = nv.myAnswer
          this.answer = nv.answer
        }
      },
    },
  },
  data () {
    return {
      //我的答案
      myAnswer: '',
      answer: '',
      //答案列表
      answerList: [],
    }
  },
  mounted () { this.getAnswer() },
  methods: {
    getClass (item) {
      //判断答案是否在正确答案中
      if (this.answer == item.id) {
        return 'background'
      }
      if (this.myAnswer == item.id) {
        return 'background2'
      }

    },
    getAnswer () {
      this.axios.post(`/exam/userpaper/getAnswer?questionId=${this.question.id}`).then(data => {
        this.answerList = data
      }).catch(e => { })
    },
  },
}

</script>
<style  scoped>
.ql-editor >>> img {
  max-width: 90%;
}
.col {
  padding: 10px;
  box-shadow: 0 0 3px #aca6a6;
}
.answer {
  font-size: 30px !important;
  margin-bottom: 10px;
  width: 100%;
  white-space: pre-wrap;
  line-height: 1.5;
}
.el-radio.is-bordered {
  height: auto !important;
  min-height: 65px;
}
.background {
  background-color: rgb(130, 229, 130);
}
.background2 {
  background-color: rgb(235, 98, 98);
}
</style>