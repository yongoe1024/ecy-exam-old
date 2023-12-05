<template>
  <div class="TrueFalse">
    <span class="ql-editor"
          v-html="question.content"></span>
    <el-divider></el-divider>
    <e-editor v-model="myValue"></e-editor>
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
<style >
.TrueFalse {
  width: 100%;
  min-height: 70%;
}
.TrueFalse img {
  width: 90%;
}
</style>