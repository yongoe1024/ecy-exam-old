<template>
  <div style="display:inline-block;">
    <el-button type="primary"
               style="margin-left: 10px;"
               :disabled="!bankId"
               round
               size="mini"
               icon="el-icon-plus"
               @click="dialogVisible = true">添加题目</el-button>
    <el-dialog :visible.sync="dialogVisible"
               :fullscreen="true"
               :close-on-click-modal="false">
      <el-form>
        <el-form-item label="选题类型">
          <el-switch style="margin-left:10px"
                     v-model="myValue.isAutoSelect"
                     active-text="随机选题"></el-switch>
        </el-form-item>
        <el-form-item label="题型">
          <el-row>
            <el-col :offset="1"
                    :span="4">单选 </el-col>
            <el-col :offset="1"
                    :span="4">多选 </el-col>
            <el-col :offset="1"
                    :span="4">判断 </el-col>
            <el-col :offset="1"
                    :span="4">简答 </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="题数"
                      v-if="myValue.isAutoSelect">
          <el-row class="num">
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               :max="bank.singleChoice"
                               v-model="myValue.singleChoice"></el-input-number>{{` / ${bank.singleChoice}`}}
            </el-col>
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               :max="bank.multipleChoice"
                               v-model="myValue.multipleChoice"></el-input-number>{{` / ${bank.multipleChoice}`}}
            </el-col>
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               :max="bank.trueFalse"
                               v-model="myValue.trueFalse"></el-input-number>{{` / ${bank.trueFalse}`}}
            </el-col>
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               :max="bank.shortAnswer"
                               v-model="myValue.shortAnswer"></el-input-number> {{` / ${bank.shortAnswer}`}}
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item label="分值">
          <el-row class="num">
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               v-model="myValue.singleChoiceScore"></el-input-number>
            </el-col>
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               v-model="myValue.multipleChoiceScore"></el-input-number>
            </el-col>
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               v-model="myValue.trueFalseScore"></el-input-number>
            </el-col>
            <el-col :offset="1"
                    :span="4">
              <el-input-number size="small"
                               :min="0"
                               v-model="myValue.shortAnswerScore"></el-input-number>
            </el-col>
          </el-row>
        </el-form-item>
        <el-divider></el-divider>
        <el-form-item v-if="!myValue.isAutoSelect">
          <div class="head">
            <el-input v-model="queryParam.content"
                      size="small"
                      prefix-icon="el-icon-search"
                      placeholder="请输入题目"></el-input>
            <e-dict name="题目类型"
                    v-model="queryParam.type"
                    size="small"
                    placeholder="请输入类型"></e-dict>
            <e-dict name="题目难度"
                    v-model="queryParam.level"
                    size="small"
                    placeholder="请输入题目难度"></e-dict>
          </div>
          <el-button type="primary"
                     size="mini"
                     plain
                     icon="el-icon-search"
                     @click="getQuestiontList">搜索</el-button>
          <el-button size="mini"
                     plain
                     icon="el-icon-refresh"
                     @click="resetQuery">重置</el-button>
          <el-table :data="dataList"
                    style="width: 100%"
                    :header-cell-style="{background:'#eef1f6'}"
                    @selection-change="handleSelectionChange">
            <el-table-column align="center"
                             type="selection"
                             width="55"></el-table-column>
            <el-table-column align="center"
                             type="index"></el-table-column>
            <el-table-column prop="questionBankName"
                             label="题库"
                             width="200"
                             align="center"></el-table-column>
            <el-table-column prop="content"
                             label="题目"
                             align="center">
              <template slot-scope="scope">
                <div v-html="scope.row.content"
                     class="content"></div>
              </template>
            </el-table-column>
            <el-table-column prop="type"
                             label="类型"
                             width="100"
                             align="center"></el-table-column>
            <el-table-column prop="level"
                             label="题目难度"
                             width="100"
                             align="center"></el-table-column>
          </el-table>
          <el-pagination background
                         style="display:flex;justify-content:center;"
                         @size-change="handleSizeChange"
                         @current-change="handleCurrentChange"
                         :page-size="size"
                         layout="total, sizes, prev, pager, next, jumper"
                         :total="total"></el-pagination>
        </el-form-item>
      </el-form>

      <span slot="footer">
        <el-button plain
                   type="success"
                   icon="el-icon-plus"
                   @click="handleAddQuestion">添加题目</el-button>
        <el-button @click="dialogVisible = false">关闭</el-button>
      </span>
    </el-dialog>
  </div>
</template>


<script>
export default {
  props: {
    value: {
      type: Object,
      default: () => {
        return {
          questionIdList: [],
          isAutoSelect: false,
          singleChoice: 0,
          multipleChoice: 0,
          trueFalse: 0,
          shortAnswer: 0,
          singleChoiceScore: 0,
          multipleChoiceScore: 0,
          trueFalseScore: 0,
          shortAnswerScore: 0,
        }
      }
    },
    bankId: {
      default: () => null
    },
  },
  watch: {
    bankId: {
      handler (nv) {
        this.getQuestiontList()
        this.getbank()
        this.$emit("input", {
          questionIdList: [],
          isAutoSelect: false,
          singleChoice: 0,
          multipleChoice: 0,
          trueFalse: 0,
          shortAnswer: 0,
          singleChoiceScore: 0,
          multipleChoiceScore: 0,
          trueFalseScore: 0,
          shortAnswerScore: 0,
        })
      },
    },
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
      dialogVisible: false,
      // 多选框数据
      multipleSelection: [],
      total: 0,
      current: 1,
      size: 10,
      myValue: [],


      bank: {},
      myValue: {
        questionIdList: [],
        isAutoSelect: false,
        singleChoice: 0,
        multipleChoice: 0,
        trueFalse: 0,
        shortAnswer: 0,
        singleChoice: 0,
        multipleChoice: 0,
        trueFalse: 0,
        shortAnswer: 0,
      },
      dataList: [],
      queryParam: {
        questionBankId: null,
        content: null,
        type: null,
        level: null,
      },
    }
  },
  mounted () { },
  methods: {
    handleAddQuestion () {
      if (this.myValue.isAutoSelect) {
        this.$message.success('随机抽题')
        return
      }
      this.myValue.questionIdList = this.multipleSelection
      this.$message.success('添加了' + this.multipleSelection.length + '道题目')
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
      this.getQuestiontList()
    },
    // 点击页数
    handleCurrentChange (val) {
      this.current = val
      this.getQuestiontList()
    },
    // 获取题库信息
    getbank () {
      this.axios.post(`/exam/questionbank/banklist?bankId=${this.bankId}`).then(data => {
        this.bank = data[0]
      }).catch(e => { })
    },
    // 获取题目列表
    getQuestiontList () {
      this.loading = true
      this.queryParam.questionBankId = this.bankId
      this.axios.post(`/exam/question/page?current=${this.current}&size=${this.size}`, this.queryParam).then(data => {
        this.dataList = data.list
        this.total = data.total - 0
      }).catch(e => { })
    },
  },
}

</script>
<style scoped>
.num .el-input {
  width: 70px !important;
}
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
.content {
  max-height: 100px;
}
.content >>> img {
  display: none;
}
</style>