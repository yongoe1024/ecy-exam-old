<template>
  <div class="box">
    <el-page-header @back="$router.back()"
                    style="margin-bottom:30px"></el-page-header>
    <el-card>
      <div slot="header">
        <span>组卷信息</span>
      </div>
      <el-descriptions :column="2"
                       style="width: 80%;"
                       border>
        <el-descriptions-item label="单选">{{question.singleChoice}}</el-descriptions-item>
        <el-descriptions-item label="多选">{{question.multipleChoice}}</el-descriptions-item>
        <el-descriptions-item label="判断">{{question.trueFalse}}</el-descriptions-item>
        <el-descriptions-item label="简答">{{question.shortAnswer}}</el-descriptions-item>
      </el-descriptions>
    </el-card>

    <el-card>
      <div slot="header">
        <span>考试配置</span>
      </div>
      <el-descriptions :column="1"
                       style="width: 50%;"
                       border>
        <el-descriptions-item label="及格分">{{config.passScore}}</el-descriptions-item>
        <el-descriptions-item label="总分">{{config.totalScore}}</el-descriptions-item>
        <el-descriptions-item label=""><el-button @click="handleFinish">提前结束考试</el-button></el-descriptions-item>

      </el-descriptions>
    </el-card>

    <el-card>
      <div slot="header">
        <span>权限配置</span>
      </div>
      <el-descriptions border
                       style="width: 50%;"
                       :column="1">
        <el-descriptions-item label="开放形式">
          <el-tag size="small">{{auth.openType}}</el-tag>
        </el-descriptions-item>
        <el-descriptions-item v-if="auth.openType=='部门开放'"
                              label="详细信息">
          <div v-for="(item, index) in auth.examDeptList"
               :key="index"
               style="margin-bottom: 10px;">
            <el-tag size="small"
                    style="margin-right: 10px;">{{item}}</el-tag>
          </div>
        </el-descriptions-item>
        <el-descriptions-item v-if="auth.openType=='指定开放'"
                              label="详细信息">
          <div v-for="(item, index) in auth.examUserList"
               :key="index"
               style="margin-bottom: 10px;">
            <el-tag size="small"
                    style="margin-right: 10px;">{{item}}</el-tag>
          </div>
        </el-descriptions-item>
      </el-descriptions>
    </el-card>
  </div>
</template>


<script>
export default {
  data () {
    return {
      // 考试id
      examId: null,

      question: {
        singleChoice: 0,
        multipleChoice: 0,
        trueFalse: 0,
        shortAnswer: 0
      },
      config: {
        totalScore: 0,
        passScore: 0,
      },
      auth: {
        openType: '',
        examDeptList: [],
        examUserList: [],
      },
    }
  },
  mounted () {
    this.examId = this.$route.query.examId
    // 获取题库列表
    this.getInfo()
  },
  methods: {
    handleFinish () {
      this.axios.post(`/exam/exam/finish/${this.examId}`).then(data => {
      }).catch(e => { })
    },
    // 初始化数据
    getInfo () {
      this.axios.post(`/exam/exam/info/${this.examId}`).then(data => {
        this.question = data.question
        this.config = data.config
        this.auth = data.auth
      }).catch(e => { })
    },
  },
}

</script>
<style scoped>
.box .el-card {
  margin-bottom: 20px;
}
</style>