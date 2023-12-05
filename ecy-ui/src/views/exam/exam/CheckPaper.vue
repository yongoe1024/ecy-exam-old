<template>
  <div>
    <el-page-header @back="$router.back()"
                    style="margin-bottom:30px"></el-page-header>
    <div class="head">
      <e-dict name="考生试卷状态"
              placeholder="请输入考试状态"
              v-model="queryParam.status"></e-dict>
    </div>
    <div class="button">
      <el-button type="primary"
                 size="mini"
                 plain
                 icon="el-icon-search"
                 @click="getList">搜索</el-button>
      <el-button size="mini"
                 plain
                 icon="el-icon-refresh"
                 @click="resetQuery">重置</el-button>
      <el-button icon="el-icon-download"
                 size="mini"
                 type="warning"
                 plain
                 @click="handleExport">导出数据</el-button>
    </div>

    <!-- 表格 -->
    <el-table v-loading="loading"
              :data="dataList"
              style="width: 100%"
              :header-cell-style="{background:'#eef1f6'}">
      <el-table-column align="center"
                       type="index"></el-table-column>
      <el-table-column prop="name"
                       label="用户"
                       align="center"></el-table-column>
      <el-table-column prop="status"
                       label="考试状态"
                       align="center">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status == 1"
                  size="small"
                  type="info">未参加</el-tag>
          <el-tag v-else-if="scope.row.status == 2"
                  size="small">考试中</el-tag>
          <el-tag v-else-if="scope.row.status == 3"
                  size="small"
                  type="danger">未通过</el-tag>
          <el-tag v-else-if="scope.row.status == 4"
                  size="small"
                  type="success">通过</el-tag>
          <el-tag v-else-if="scope.row.status == 5"
                  size="small"
                  type="">已交卷</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="enterTime"
                       label="开始时间"
                       align="center"></el-table-column>
      <el-table-column prop="finishTime"
                       label="交卷时间"
                       align="center"></el-table-column>
      <el-table-column prop="score"
                       label="得分"
                       align="center"></el-table-column>
      <el-table-column label="操作"
                       align="center"
                       width="140"
                       fixed="right">
        <template slot-scope="scope">
          <el-button v-if="scope.row.status!=1 && scope.row.status!=2"
                     type="text"
                     size="mini"
                     icon="el-icon-edit"
                     @click="handleShowUpdateEdit(scope.row)">批改</el-button>
        </template>
      </el-table-column>
    </el-table>

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
  components: {},
  data () {
    return {
      total: 0,
      current: 1,
      size: 10,
      loading: false,
      dialogVisible: false,

      // 考试id
      examId: null,
      dataList: [],
      queryParam: {
        id: null,
        userId: null,
        examId: null,
        status: null,
        enterTime: null,
        finishTime: null,
        score: null,
      },
    }
  },
  mounted () {
    this.examId = this.$route.query.examId
    this.getList()
  },
  methods: {
    handleExport () {
      this.$downloadRequest('/exam/userpaper/export/' + this.examId, this.queryParam)
    },
    //跳转到 题目批改
    handleShowUpdateEdit (row) {
      this.$router.push({ path: '/exam-exam-CheckQuestion', query: { userId: row.userId, examId: this.examId } })
    },
    resetQuery () {
      this.queryParam = this.$options.data().queryParam
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
      this.queryParam.examId = this.examId
      this.axios.post(`/exam/userpaper/checkPaper?current=${this.current}&size=${this.size}`, this.queryParam).then(data => {
        this.loading = false
        this.dataList = data.list
        this.total = data.total - 0
      }).catch(e => this.loading = false)
    },
  },
}
</script>
<style scoped>
.head {
  display: flex;
  flex-wrap: wrap;
}
.head .el-input {
  width: 200px !important;
}
.head * {
  margin: 0 8px 8px 0;
}
.button {
  margin: 0 0 15px 0;
  display: flex;
}
.button * {
  margin: 0 8px 0 0;
}
</style>