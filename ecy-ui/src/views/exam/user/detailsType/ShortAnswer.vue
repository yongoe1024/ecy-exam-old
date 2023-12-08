<template>
  <div>
    <el-row>
      <el-col :span="12"
              class="col">
        题目 <div class="ql-editor"
             v-html="question.content"></div>
      </el-col>
      <el-col :offset="1"
              class="col"
              :span="11">
        标准答案<div class="ql-editor"
             v-html="question.answer"></div>
      </el-col>
    </el-row>
    <el-divider></el-divider>
    <div class="ql-editor col"
         style="width: 80%;"
         v-html="myAnswer"></div>
    <div style="float:right;margin:5px">
      得分：<el-link v-if="question.isTrue"
               style="font-size:30px"
               type="success">{{question.myScore}}</el-link>
      <el-link v-else
               style="font-size:30px"
               type="danger">{{question.myScore}}</el-link>
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
        this.myAnswer = nv.myAnswer
      },
    },
  },
  data () {
    return {
      //我的答案
      myAnswer: '',
    }
  },
  mounted () { },
  methods: {},
}

</script>
<style  scoped>
.col {
  padding: 10px;
  box-shadow: 0 0 3px #aca6a6;
}
</style>