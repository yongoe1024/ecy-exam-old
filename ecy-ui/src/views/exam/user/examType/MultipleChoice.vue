<template>
  <div>
    <div class="ql-editor"
         v-html="question.content"></div>
    <el-divider></el-divider>
    <el-checkbox-group v-model="myValue">
      <el-checkbox v-for="(item, index) in answerList"
                   :key="index"
                   class="answer"
                   border
                   :label="item.id">
        <span>{{`${String.fromCharCode(65+index)}. `}}</span>
        <span class="ql-editor"
              style="display:inline-block;width: 90%;"
              v-html="item.content"></span>
      </el-checkbox>
    </el-checkbox-group>
  </div>
</template>


<script>
export default {
  props: {
    value: {
      type: String,
      default: () => "[]"
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
        if (nv) {
          this.myValue = JSON.parse(nv)
        }
        this.getAnswer()
      },
    },
    myValue: {
      immediate: true,
      handler (nv) {
        this.$emit("input", JSON.stringify(nv))
      }
    },
  },
  data () {
    return {
      myValue: [],
      answerList: []
    }
  },
  mounted () {
    this.getAnswer()
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
.answer {
  font-size: 30px !important;
  margin-bottom: 10px;
  width: 100%;
  white-space: pre-wrap;
  line-height: 1.5;
}
.answer .ql-editor >>> img {
  width: 90%;
}
.el-checkbox.is-bordered {
  margin-left: 0px !important;
  min-height: 65px !important;
  height: auto !important;
}
</style>