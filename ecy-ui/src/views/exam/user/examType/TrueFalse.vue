<template>
  <div>
    <div class="ql-editor"
         v-html="question.content"></div>
    <el-divider></el-divider>
    <div v-for="(item, index) in answerList"
         :key="index">
      <el-radio v-model="myValue"
                class="answer"
                border
                :label="item.id">
        <span class="ql-editor"
              style="display:inline-block;"
              v-html="item.content"></span>
      </el-radio>
    </div>
  </div>
</template>


<script>
export default {
  props: {
    value: {
      type: String,
      default: () => ''
    },
    question: {
      type: Object,
      default: () => {
        return {}
      },
    },
  },
  watch: {
    value: {
      immediate: true,
      handler (nv) {
        this.myValue = nv
        this.getAnswer()
      },
    },
    myValue: {
      immediate: true,
      handler (nv) {
        this.$emit("input", nv)
      }
    },
  },
  data () {
    return {
      myValue: '',
      answerList: []
    }
  },
  mounted () {
  },
  methods: {
    getAnswer () {
      this.axios.post(`/exam/userpaper/getAnswer?questionId=${this.question.id}`).then(data => {
        this.answerList = data
      }).catch(e => { })
    },
  },
}

</script>
<style scoped >
.answer {
  font-size: 30px !important;
  margin-bottom: 10px;
  width: 100%;
}
.el-radio.is-bordered {
  height: auto !important;
  min-height: 45px !important;
}
</style>