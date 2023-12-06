<template>
  <div class="box">
    <div>
      <el-input v-model="queryParam.examName"
                style="width:300px"
                prefix-icon="el-icon-search"
                placeholder="请输入考试名称"></el-input>
      <el-button type="primary"
                 style="margin:5px"
                 plain
                 icon="el-icon-search"
                 @click="getList">搜索</el-button>
    </div>
    <div class="context">
      <el-card v-for="item in dataList"
               :key="item.id"
               class="card">
        <div slot="header">
          <span>{{item.examRes.examName}}</span>
          <el-button v-if="item.examRes.status == 3 && (item.status == 1||item.status == 2)"
                     @click="kaoshi(item.examRes.id)"
                     style="float: right; padding: 3px 0"
                     type="text">开始考试</el-button>
          <el-button v-if="(item.status == 3||item.status == 4)"
                     @click="examInfo(item.examRes.id)"
                     style="float: right; padding: 3px 0"
                     type="text">查看详情</el-button>
        </div>
        <el-descriptions :column="1">
          <el-descriptions-item label="我的状态">
            <el-tag v-if="item.status == 1"
                    size="small"
                    type="info">未参加</el-tag>
            <el-tag v-else-if="item.status == 2"
                    size="small">考试中</el-tag>
            <el-tag v-else-if="item.status == 3"
                    size="small"
                    type="danger">未通过</el-tag>
            <el-tag v-else-if="item.status == 4"
                    size="small"
                    type="success">通过</el-tag>
            <el-tag v-else-if="item.status == 5"
                    size="small"
                    type="">已交卷</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="开始时间">{{item.examRes.startTime}}</el-descriptions-item>
          <el-descriptions-item label="结束时间">{{item.examRes.endTime}}</el-descriptions-item>
          <el-descriptions-item label="考试时间">{{item.examRes.duration}}分钟</el-descriptions-item>
          <el-descriptions-item label="考试状态">
            <el-tag v-if="item.examRes.status == 2"
                    size="small"
                    type="success">未开始</el-tag>
            <el-tag v-else-if="item.examRes.status == 3"
                    size="small"
                    type="warning">进行中</el-tag>
            <el-tag v-else-if="item.examRes.status == 4"
                    size="small"
                    type="info">已结束</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="描述">{{item.examRes.examDesc}}</el-descriptions-item>

        </el-descriptions>

      </el-card>
    </div>

    <!-- 分页 -->
    <el-pagination background
                   style="display:flex;justify-content:center;"
                   @size-change="handleSizeChange"
                   @current-change="handleCurrentChange"
                   :page-size="size"
                   layout="total, sizes, prev, pager, next, jumper"
                   :total="total"></el-pagination>
  </div>
</template>


<script>
export default {
  data () {
    return {
      total: 0,
      current: 1,
      size: 10,
      dataList: [],
      queryParam: {
        examName: null,
      },
    }
  },
  mounted () {
    this.getList()
  },
  methods: {
    examInfo (examId) {
      this.$router.push({ path: '/exam-user-ExamDetails', query: { examId: examId } })
    },
    kaoshi (examId) {
      const href = this.$router.resolve({
        path: `/exam-active`,
        query: { examId: examId },
      }).href
      //打开新的页面 到 href 这个页面
      window.open(href, "_blank")
    },
    // 改变页码
    handleSizeChange (val) {
      this.size = val
      this.getList()
    },
    // 点击页数
    handleCurrentChange (val) {
      this.current = val
      this.getList()
    },
    // 初始化数据
    getList () {
      this.loading = true
      this.axios.post(`/exam/userpaper/page?current=${this.current}&size=${this.size}`, this.queryParam).then(data => {
        this.dataList = data.list
        this.total = data.total - 0
      }).catch(e => { })
    },
  },
}

</script>
<style scoped>
.context {
  display: flex;
  flex-wrap: wrap;
}
.card {
  width: 300px;
  margin: 20px;
  min-height: 200px;
}
</style>