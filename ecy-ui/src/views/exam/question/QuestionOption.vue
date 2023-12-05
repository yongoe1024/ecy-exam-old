<template>
  <div>
    <el-page-header @back="$router.back()"
                    style="margin-bottom:30px"
                    content="题目选项"></el-page-header>
    <el-card>
      <div slot="header">
        <span>题目</span>
      </div>
      <div class="ql-editor"
           v-html="question.content">
      </div>
    </el-card>
    <el-card>
      <div slot="header">
        <span>答案</span>
      </div>
      <div class="ql-editor"
           v-html="question.answer">
      </div>
    </el-card>
    <el-button type="success"
               v-auth="'增'"
               size="small"
               plain
               style="margin: 10px;"
               @click="handleShowAddEdit"
               icon="el-icon-plus">添加选项</el-button>
    <!-- 表格 -->
    <el-table v-loading="loading"
              :data="dataList"
              style="width: 100%"
              :header-cell-style="{background:'#eef1f6'}"
              @selection-change="handleSelectionChange">
      <el-table-column align="center"
                       type="selection"
                       width="55"></el-table-column>
      <el-table-column align="center"
                       type="index"></el-table-column>
      <el-table-column prop="content"
                       label="内容"
                       align="center">
        <template slot-scope="scope">
          <div v-html="scope.row.content"
               style="max-height:150px"></div>
        </template>
      </el-table-column>
      <el-table-column prop="isTrue"
                       label="是否正确"
                       width="140"
                       align="center">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isTrue"
                  effect="dark"
                  type="success">是
          </el-tag>
          <el-tag v-else
                  effect="dark"
                  type="danger">否
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作"
                       align="center"
                       width="140"
                       fixed="right">
        <template slot-scope="scope">
          <el-button v-auth="'改'"
                     type="text"
                     size="mini"
                     icon="el-icon-edit"
                     @click="handleShowUpdateEdit(scope.row)">编辑</el-button>
          <el-button v-auth="'删'"
                     type="text"
                     size="mini"
                     icon="el-icon-delete"
                     @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 批量删除 -->
    <el-button style="margin-top: 8px"
               v-auth="'删'"
               type="danger"
               size="small"
               :disabled="multipleSelection.length == 0"
               @click="handleDeleteMany">批量删除</el-button>
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
               width="70%">
      <el-form ref="form"
               :model="form"
               label-width="auto"
               style="margin:20px"
               :rules="rules">
        <el-form-item label="内容"
                      prop="content">
          <e-editor v-model="form.content"></e-editor>
        </el-form-item>
        <el-form-item label="是否正确"
                      prop="isTrue">
          <el-switch v-model="form.isTrue"
                     active-color="#13ce66"
                     inactive-color="#ff4949"></el-switch>
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
      question: {},
      form: {
        id: null,
        questionId: null,
        content: null,
        isTrue: false,
      },
      queryParam: {
        id: null,
        questionId: null,
        content: null,
        isTrue: null,
      },
      rules: {
        questionId: [{ required: true, message: '请输入题目', trigger: 'change' }],
        content: [{ required: true, message: '请输入内容', trigger: 'change' }],
        isTrue: [{ required: true, message: '请输入是否正确', trigger: 'change' }],
      },
    }
  },
  mounted () {
    this.queryParam.questionId = this.$route.query.questionId
    this.form.questionId = this.$route.query.questionId
    this.axios.post(`/exam/question/page?current=1&size=1`, { id: this.queryParam.questionId }).then(data => {
      this.question = data.list[0]
    }).catch(e => { })
    this.getList()
  },
  methods: {
    reset () {
      this.form = this.$options.data().form
      this.form.questionId = this.$route.query.questionId
    },
    resetQuery () {
      this.queryParam = this.$options.data().queryParam
      this.queryParam.questionId = this.$route.query.questionId
    },
    handleExport () {
      this.$downloadRequest('/exam/questionoption/export', this.queryParam)
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
    handleShowUpdateEdit (row) {
      this.dialogTitle = '修改'
      Object.assign(this.form, row)
      this.dialogVisible = true
    },
    handleAddOrUpdate () {
      this.$refs.form.validate((valid) => {
        if (valid) {
          if (this.form.id) {
            this.axios.post('/exam/questionoption/update', this.form).then(() => {
              this.getList()
              this.dialogVisible = false
            }).catch(e => { })
          } else {
            this.axios.post('/exam/questionoption/add', this.form).then(() => {
              this.getList()
              this.dialogVisible = false
            }).catch(e => { })
          }
        }
      })
    },
    handleDelete (row) {
      this.$confirm('此操作将永久删除这条数据, 是否继续?', '提示', { type: 'warning' }).then(() => {
        this.axios.post('/exam/questionoption/delete/' + row.id).then(() => this.getList()).catch(e => { })
      }).catch(e => { })
    },
    handleDeleteMany () {
      this.$confirm('此操作将永久删除 [' + this.multipleSelection.length + '] 条数据, 是否继续?', '提示', { type: 'warning' }).then(() => {
        this.axios.post('/exam/questionoption/delete/' + this.multipleSelection).then(() => this.getList()).catch(e => { })
      }).catch(e => { })
    },
    // 初始化数据
    getList () {
      this.loading = true
      this.axios.post(`/exam/questionoption/page?current=${this.current}&size=${this.size}`, this.queryParam).then(data => {
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