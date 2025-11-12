@Component
export struct SearchBar {
  build() {
    Row() {
      Search({ placeholder: "请输入商品名称" })
    }.width("100%")
  }
}