<template>
  <div class="SingleChoice">
    <el-row>
      <el-col :span="12"
              class="col">
        题目 <span class="ql-editor"
              v-html="question.content"></span>
      </el-col>
      <el-col :offset="1"
              class="col"
              :span="11">
        标准答案<span class="ql-editor"
              v-html="question.answer"></span>
      </el-col>
    </el-row>
    <el-divider></el-divider>
    学生答案： <span class="ql-editor"
          v-html="myValue"></span>
    <div style="float:right;margin:5px">
      得分： <el-input-number :min="0"
                       :max="question.score"
                       v-model="question.myScore"></el-input-number>
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
    }
  },
  mounted () { },
  methods: {},
}

</script>
<style  >
.SingleChoice {
  width: 100%;
  min-height: 70%;
}
.SingleChoice img {
  width: 100%;
}
.col {
  padding: 10px;
  box-shadow: 0 0 3px #aca6a6;
}
</style>