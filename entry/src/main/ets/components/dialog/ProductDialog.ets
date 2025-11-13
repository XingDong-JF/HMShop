import { SpecificationModel } from "../../model/SpecificationModel"
import { GoodsSKUModel } from "../../model/GoodsSKUModel"

@Component
@CustomDialog
export struct ProductDialog {
  controller: CustomDialogController
  @Prop specification: SpecificationModel[];
  @Prop product: GoodsSKUModel[];
  @State count: number = this.product[0].number

  build() {
    Column() {
      Column() {
        Row() {
          Column() {
            Image(this.product[0].url).width(96).height(96)
          }.margin({ left: 20 })

          Column() {
            Text() {
              Span("￥").fontColor(Color.Red).fontSize(16)
              Span(this.product[0].price.toString()).fontColor(Color.Red).fontSize(22).margin({ left: 2 })
            }

            Text("请选择").fontSize(16).fontColor("#969799").margin({ top: 10 })
          }
        }
        .width("100%")
        .padding(20)
        .border({ width: { bottom: 2 }, color: { bottom: "#f2f2f2" } })
        .align(Alignment.Start)

        Column() {
          Row() {
            Text(this.specification[0].name)
          }.width("100%")

          Row() {
            Text(this.specification[0].valueList[0].value)
              .padding(8)
              .fontColor("#323233")
              .backgroundColor("#ffefefef")
              .borderRadius(4)
              .margin({ left: 20, top: 10 })
          }.width("100%")
        }
        .width("100%")
        .padding(20)
        .border({ width: { bottom: 2 }, color: { bottom: "#f2f2f2" } })
        .align(Alignment.Start)

        Row() {
          Column() {
            Text("购买数量")
          }

          Row() {
            // 减号按钮
            Button('-')
              .fontSize(14)
              .backgroundColor("#ffefefef")
              .fontColor("#323233")
              .padding(8)
              .borderRadius(2)
              .onClick(() => {
                if (this.count > 0) {
                  this.count--
                }
              })

            // 数值显示
            Text(this.count.toString())
              .fontSize(14)
              .padding(8)
              .backgroundColor("#fff6f6f6")
              .margin({ left: 10, right: 10 })
              .textAlign(TextAlign.Center)

            // 加号按钮
            Button('+')
              .fontSize(14)
              .borderRadius(2)
              .backgroundColor("#ffefefef")
              .fontColor("#323233")
              .padding(8)
              .onClick(() => {
                this.count++
              })
          }
        }.width("90%").padding({ top: 10 }).justifyContent(FlexAlign.SpaceBetween)
      }

      Row() {
        Column() {
          Image($r("app.media.tongzhi")).width(30)
        }.margin({ left: 20 })

        Row() {
          Column() {
            Button("加入购物车")
              .padding({
                top: 10,
                bottom: 10,
                left: 20,
                right: 20
              })
              .fontColor(Color.White)
              .type(ButtonType.Normal)
              .linearGradient({
                angle: 90,
                direction: GradientDirection.Left,
                colors: [
                  ["#ffd01e", 0],
                  ["#ff8917", 1]
                ]
              })
              .borderRadius({ topLeft: '50%', bottomLeft: '50%', })
          }

          Column() {
            Button("立即购买")
              .padding({
                top: 10,
                bottom: 10,
                left: 20,
                right: 20
              })
              .margin({ right: 10 })
              .fontColor(Color.White)
              .type(ButtonType.Normal)
              .linearGradient({
                angle: 90,
                direction: GradientDirection.Left,
                colors: [
                  ["#ff6034", 0],
                  ["#ee0a24", 1]
                ]
              })
              .borderRadius({ topRight: '50%', bottomRight: '50%', })
          }
        }
      }
      .width("100%")
      .height(60)
      .border({ width: { top: 1 }, color: { top: "#f2f2f2" } })
      .backgroundColor(Color.White)
      .justifyContent(FlexAlign.SpaceBetween)
    }.height("100%").width("100%")
  }
}
