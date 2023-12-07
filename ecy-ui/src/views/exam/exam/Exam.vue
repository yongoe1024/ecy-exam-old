<template>
  <div>
    <!-- 搜索 -->
    <div class="head">
      <el-input v-model="queryParam.examName"
                size="small"
                prefix-icon="el-icon-search"
                placeholder="请输入考试名称"></el-input>
      <el-input v-model="queryParam.examDesc"
                size="small"
                prefix-icon="el-icon-search"
                placeholder="请输入考试描述"></el-input>
      <e-dict name="开放形式"
              size="small"
              v-model="queryParam.openType"
              placeholder="开放形式"> </e-dict>
      <e-dict name="考试发布状态"
              size="small"
              v-model="queryParam.status"
              placeholder="考试发布状态"> </e-dict>
    </div>
    <!-- 按钮 -->
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
      <el-button type="success"
                 size="mini"
                 plain
                 @click="handleShowAddEdit"
                 icon="el-icon-plus">添加</el-button>
    </div>

    <!-- 表格 -->
    <el-table v-loading="loading"
              :data="dataList"
              style="width: 100%"
              :header-cell-style="{background:'#eef1f6'}">
      <el-table-column align="center"
                       type="index"></el-table-column>
      <el-table-column prop="examName"
                       label="考试名称"
                       width="140"
                       align="center"></el-table-column>
      <el-table-column prop="startTime"
                       label="考试开始时间"
                       width="180"
                       align="center"></el-table-column>
      <el-table-column prop="endTime"
                       label="考试结束时间"
                       width="180"
                       align="center"></el-table-column>
      <el-table-column prop="duration"
                       label="考试时长"
                       align="center"></el-table-column>
      <el-table-column prop="openType"
                       label="开放形式"
                       align="center">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.openType == 1"
                  effect="dark">全部开放
          </el-tag>
          <el-tag v-else-if="scope.row.openType == 2"
                  effect="dark">部门开放
          </el-tag>
          <el-tag v-else-if="scope.row.openType == 3"
                  effect="dark">指定开放
          </el-tag>
          <el-tag v-else
                  effect="dark"
                  type="info">未选择
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="status"
                       label="状态"
                       align="center">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status == 1"
                  effect="dark"
                  type="warning">未选题
          </el-tag>
          <el-tag v-else-if="scope.row.status == 2"
                  effect="dark"
                  type="">未开始
          </el-tag>
          <el-tag v-else-if="scope.row.status == 3"
                  effect="dark"
                  type="success">进行中
          </el-tag>
          <el-tag v-else-if="scope.row.status == 4"
                  effect="dark"
                  type="info">已结束
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="createTime"
                       label="创建时间"
                       align="center"></el-table-column>
      <el-table-column prop="createBy"
                       label="创建人"
                       align="center"></el-table-column>
      <el-table-column label="操作"
                       align="center"
                       width="200"
                       fixed="right">
        <template slot-scope="scope">
          <el-button v-if="scope.row.status == 1"
                     type="text"
                     size="mini"
                     @click="handleSelectQuestion(scope.row)">组卷</el-button>
          <el-button v-if="scope.row.status == 4 ||  scope.row.status == 3"
                     type="text"
                     size="mini"
                     @click="handleCheckPaper(scope.row)">阅卷</el-button>
          <el-button v-if="scope.row.status != 1"
                     type="text"
                     size="mini"
                     @click="handleExamInfo(scope.row)">详情</el-button>
          <el-button type="text"
                     size="mini"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)">删除</el-button>
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

    <el-dialog :visible.sync="dialogVisible"
               :title="dialogTitle"
               @close="reset"
               :close-on-click-modal="false"
               width="800px">
      <el-form ref="form"
               :model="form"
               label-width="auto"
               style="margin:20px"
               :rules="rules">
        <el-form-item label="考试名称"
                      prop="examName">
          <el-input v-model="form.examName"
                    placeholder="请输入考试名称" />
        </el-form-item>
        <el-form-item label="考试描述"
                      prop="examDesc">
          <el-input v-model="form.examDesc"
                    placeholder="请输入考试描述" />
        </el-form-item>
        <el-form-item label="考试开始时间"
                      prop="startTime">
          <el-date-picker v-model="form.startTime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          type="datetime"
                          placeholder="考试开始时间"></el-date-picker>
        </el-form-item>
        <el-form-item label="考试结束时间"
                      prop="endTime">
          <el-date-picker v-model="form.endTime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          type="datetime"
                          placeholder="考试结束时间"></el-date-picker>
        </el-form-item>
        <el-form-item label="考试时长(分钟)"
                      prop="duration">
          <el-input-number v-model="form.duration"
                           :min="10"
                           :max="duration"
                           label="请输入考试时长"></el-input-number>
        </el-form-item>
      </el-form>
      <span slot="footer">
        <el-button @click="dialogVisible = false">取 消</el-button>
        <el-button type="primary"
                   @click="handleAddOrUpdate">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
export default {
  components: {},
  props: {},
  computed: {
    duration () {
      return parseInt((this.end.getTime() - this.start.getTime()) / 1000 / 60)
    },
    start () {
      return new Date(this.form.startTime)
    },
    end () {
      return new Date(this.form.endTime)
    },
  },
  data () {
    return {
      // 多选框数据
      multipleSelection: [],
      total: 0,
      current: 1,
      size: 10,
      loading: false,
      dialogVisible: false,
      dialogTitle: '',

      dataList: [],
      form: {
        id: null,
        examName: null,
        examDesc: null,
        openType: null,
        duration: null,
        startTime: null,
        endTime: null,
      },
      queryParam: {
        examName: null,
        examDesc: null,
        openType: null,
        status: null,
      },
      rules: {
        examName: [{ required: true, message: '请输入考试名称', trigger: 'change' }],
        examDesc: [{ required: true, message: '请输入考试描述', trigger: 'change' }],
        openType: [{ required: true, message: '请输入开放形式', trigger: 'change' }],
        duration: [{ required: true, message: '请输入考试时长', trigger: 'change' }],
        startTime: [{ required: true, message: '请输入考试开始时间', trigger: 'change' }],
        endTime: [{ required: true, message: '请输入考试结束时间', trigger: 'change' }],
      },
    }
  },
  mounted () {
    this.getList()
  },
  methods: {

    //跳转到 考试详情
    handleExamInfo (row) {
      this.$router.push({ path: '/exam-exam-ExamInfo', query: { examId: row.id } })
    },
    //跳转到 编辑试题
    handleSelectQuestion (row) {
      this.$router.push({ path: '/exam-exam-MakePaper', query: { examId: row.id } })
    },
    //阅卷
    handleCheckPaper (row) {
      this.$router.push({ path: '/exam-exam-CheckPaper', query: { examId: row.id } })
    },
    reset () {
      this.form = this.$options.data().form
    },
    resetQuery () {
      this.queryParam = this.$options.data().queryParam
    },
    // 多选框回调
    handleSelectionChange (val) {
      this.multipleSelection = val.map(item => item.id)
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
    handleShowAddEdit () {
      this.dialogTitle = '添加'
      this.dialogVisible = true
    },
    handleAddOrUpdate () {
      let timeDifference = parseInt(this.end.getTime()) - parseInt(this.start.getTime())
      if (timeDifference < 0) {
        this.$message.error('考试结束时间不能小于考试开始时间')
        return
      }
      this.$refs.form.validate((valid) => {
        if (valid) {
          this.axios.post('/exam/exam/add', this.form).then(() => {
            this.getList()
            this.dialogVisible = false
          }).catch(e => { })
        }
      })
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除这条数据, 是否继续?', '提示', { type: 'warning' }).then(() => {
        this.axios.post('/exam/exam/delete/' + row.id).then(() => this.getList()).catch(e => { })
      }).catch(e => { })
    },
    // 初始化数据
    getList () {
      this.loading = true
      this.axios.post(`/exam/exam/page?current=${this.current}&size=${this.size}`, this.queryParam).then(data => {
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