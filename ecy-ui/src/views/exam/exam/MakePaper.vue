<template>
  <div class="box">
    <el-page-header @back="$router.back()"
                    style="margin-bottom:30px"></el-page-header>
    <el-card>
      <div slot="header">
        <span>组卷信息</span>
      </div>
      <el-form label-width="auto"
               style="margin:20px">
        <el-form-item v-for="(item, index) in bankForm.bankList"
                      :label="'题库' + (index+1)"
                      :key="item.id">
          <el-select v-model="bankForm.bankList[index].bankId"
                     filterable
                     placeholder="请选择题库">
            <el-option v-for="bank in bankList"
                       :key="bank.id"
                       :label="bank.name"
                       :value="bank.id">
            </el-option>
          </el-select>
          <select-question v-model="bankForm.bankList[index].question"
                           :bank-id="bankForm.bankList[index].bankId"></select-question>
          <el-button type="danger"
                     round
                     size="mini"
                     style="margin-left: 10px;"
                     @click.prevent="removeBank(index)">删除</el-button>
        </el-form-item>

        <el-form-item>
          <el-button @click="addBank">新增题库</el-button>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card>
      <div slot="header">
        <span>考试配置</span>
      </div>
      <el-form ref="configForm"
               :model="configForm"
               label-width="auto"
               style="margin:20px"
               :rules="configRules">
        <el-form-item label="总分"
                      prop="totalScore">
          <el-input-number v-model="configForm.totalScore"
                           :min="0"></el-input-number>
        </el-form-item>
        <el-form-item label="及格分"
                      prop="passScore">
          <el-input-number v-model="configForm.passScore"
                           :min="0"
                           :max="configForm.totalScore"></el-input-number>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card>
      <div slot="header">
        <span>权限配置</span>
      </div>
      <el-form ref="authForm"
               :model="authForm"
               label-width="auto"
               style="margin:20px"
               :rules="authRules">
        <el-form-item prop="openType">
          <e-dict name="开放形式"
                  v-model="authForm.openType"
                  placeholder="开放形式"> </e-dict>
        </el-form-item>
        <el-form-item v-if="authForm.openType == '2'">
          <e-select-dept v-model="authForm.departmenIdtList"></e-select-dept>
        </el-form-item>
        <el-form-item v-if="authForm.openType == '3'">
          <e-select-user v-model="authForm.userIdList"></e-select-user>
        </el-form-item>

      </el-form>
    </el-card>
    <el-alert title="发放试卷后无法修改"
              type="warning">
    </el-alert>
    <el-button type="primary"
               style="margin:20px"
               @click="submitForm">发放至考生</el-button>
  </div>
</template>


<script>
import ESelectUser from '@/components/e-select-user.vue'
import SelectQuestion from './SelectQuestion.vue'
import ESelectDept from '@/components/e-select-dept.vue'
export default {
  components: { SelectQuestion, ESelectUser, ESelectDept },
  computed: {
    openType () {
      return this.authForm.openType
    },
  },
  watch: {
    openType: {
      immediate: true,
      handler (nv) {
        this.authForm.departmenIdtList = []
        this.authForm.userIdList = []
      },
    },
  },
  data () {
    return {
      // 考试id
      examId: null,
      // 题库列表
      bankList: [],

      bankForm: {
        bankList: [{
          bankId: null,
          question: {}
        }],
      },
      configForm: {
        totalScore: 0,
        passScore: 0,
      },
      authForm: {
        openType: null,
        departmenIdtList: [],
        userIdList: [],
      },
      configRules: {
        totalScore: [{ required: true, message: '请输入总分', trigger: 'change' },],
        passScore: [{ required: true, message: '请输入及格分', trigger: 'change' },]
      },
      authRules: { openType: [{ required: true, message: '请选择开放类型', trigger: 'change' }] },
    }
  },
  mounted () {
    this.examId = this.$route.query.examId
    // 获取题库列表
    this.getbankList()
  },
  methods: {
    submitForm () {
      this.$refs.configForm.validate(valid => {
        if (valid) {
          this.$refs.authForm.validate(valid => {
            if (valid) {
              if (this.bankForm.bankList.length == 0 || this.bankForm.bankList[0].bankId == null) {
                this.$message.error('至少选择一个题库')
                return
              }
              for (var i = 0; i < this.bankForm.bankList.length; i++) {
                if (this.bankForm.bankList[i].question.questionIdList.length == 0) {
                  this.$message.error('题库中没有题目')
                  return
                }
              }
              if (this.isDuplicate(this.bankForm.bankList)) {
                this.$message.error('不能选择相同的题库')
                return
              }
              if (this.authForm.openType == '2' && this.authForm.departmenIdtList.length == 0) {
                this.$message.error('请选择部门')
                return
              }
              if (this.authForm.openType == '3' && this.authForm.userIdList.length == 0) {
                this.$message.error('请选择用户')
                return
              }
              // 构建题库数据表单,提到上一级，方便后端接收
              this.bankForm.bankList.forEach(item => {
                for (let key in item.question) {
                  item[key] = item.question[key]
                }
              })
              this.axios.post(`/exam/exam/makepaper/${this.examId}`, {
                bankForm: this.bankForm,
                configForm: this.configForm,
                authForm: this.authForm,
              }).then(data => {
                this.$router.push(`exam-exam-Exam`)
              }).catch(e => { })
            }
          })
        }
      })
    },
    isDuplicate (arr) {
      for (let i = 0; i < arr.length; i++) {
        for (let j = i + 1; j < arr.length; j++) {
          if (arr[i].bankId === arr[j].bankId) {
            return true
          }
        }
      }
      return false
    },
    //删除题库
    removeBank (item) {
      console.log(item)
      this.bankForm.bankList.splice(item, 1)
    },
    //添加题库
    addBank () {
      this.bankForm.bankList.push({ bankId: null, question: {} })
    },
    // 初始化数据
    getbankList () {
      this.axios.post(`/exam/questionbank/banklist`).then(data => {
        this.bankList = data
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