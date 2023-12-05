<template>
  <div style="display:inline-block;">
    <el-button type="primary"
               style="margin-left: 10px;"
               round
               size="mini"
               icon="el-icon-plus"
               @click="dialogVisible = true">添加部门</el-button>
    <el-dialog :visible.sync="dialogVisible"
               width="600px"
               :close-on-click-modal="false">

      <el-tree ref="tree"
               :check-strictly="true"
               :data="dataList"
               :default-expand-all="true"
               show-checkbox
               node-key="id"
               :props="{children: 'children', label: 'name', keyname: 'id' }"></el-tree>
      <span slot="footer">
        <el-button plain
                   type="success"
                   icon="el-icon-plus"
                   @click="handlAdd()">添加部门</el-button>
        <el-button @click="dialogVisible = false">关闭</el-button>
      </span>
    </el-dialog>
  </div>
</template>


<script>
export default {
  components: {},
  props: {
    value: {
      type: Array,
      default: () => []
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
      dialogVisible: false,
      myValue: [],
      dataList: [],
    }
  },
  mounted () { this.getList() },
  methods: {
    handlAdd () {
      let tree = this.$refs.tree
      //  父节点与子节点 ，传入的时候无关联，1. 是否只是叶子节点，默认值为 false 2. 是否包含半选节点，默认值为 false
      let selectedKeys = tree.getCheckedNodes(false, true)
      this.myValue = selectedKeys.map(item => item.id)
      this.$message.success('添加了' + selectedKeys.length + '个部门')
    },
    getList () {
      this.axios.post('/basic/department/list').then(data => {
        this.dataList = data
      }).catch(e => { })
    }
  },
}

</script>
<style scoped>
</style>