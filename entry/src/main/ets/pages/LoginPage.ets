@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      Column() {
        Image("http://hmapp.net/static/img/avatar_default.89845f4e.png").width(55).height(55).borderRadius("50%")
        Text("HMShop").fontSize(14).margin({ top: 10 })
      }.width('100%').height(120).justifyContent(FlexAlign.Center).alignItems(HorizontalAlign.Center)

      Column() {
        Row() {
          Image($r('app.media.username'))
            .width(20)
            .height(20)
            .margin({ left: 8 })

          TextInput({ placeholder: '请输入用户名' })
            .layoutWeight(1)
            .backgroundColor("transparent")
        }.width("90%").border({ width: 1, color: "#FFD7D5D5", radius: 5 }).margin({ bottom: 20 })

        Row() {
          Image($r('app.media.password'))
            .width(20)
            .height(20)
            .margin({ left: 8 })

          TextInput({ placeholder: '请输入密码' })
            .layoutWeight(1) // 占据剩余空间
            .backgroundColor("transparent")
        }.width("90%").border({ width: 1, color: "#FFD7D5D5", radius: 5 }).margin({ bottom: 10 })
      }.width("100%").justifyContent(FlexAlign.Center)

      Row() {
        Text("免费注册").fontSize(14)
        Text("忘记密码").fontSize(14)
      }.width("90%").margin({ top: 4 }).justifyContent(FlexAlign.SpaceBetween)

      Button("登录")
        .width("90%")
        .margin({ top: 20 })
        .borderRadius(4)
        .backgroundColor("#ffc40e23")
    }
    .height('100%')
    .width('100%')
  }
}