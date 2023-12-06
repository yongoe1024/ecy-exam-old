<template>
  <div>
    <div class="ql-editor"
         v-html="question.content"></div>
    <el-divider></el-divider>
    <e-editor v-model="myValue"></e-editor>
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
.ql-editor {
  min-height: 10px;
}
.ql-editor >>> img {
  max-width: 100%;
}
</style>