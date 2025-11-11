import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct Profile {
  @State username: string = '鸿蒙用户';

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Text('←')
          .fontSize(24)
          .onClick(() => {
            router.back();
          })
          .margin({ right: 15 })
        
        Text('我的')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height(60)
      .padding({ left: 20, right: 20 })
      .backgroundColor('#FFFFFF')

      Scroll() {
        Column() {
          // 用户信息卡片
          Row() {
            Text('👤')
              .fontSize(60)
              .width(80)
              .height(80)
              .textAlign(TextAlign.Center)
              .backgroundColor('#F5F5F5')
              .borderRadius(40)
            
            Column() {
              Text(this.username)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
              
              Text('欢迎来到鸿蒙商城')
                .fontSize(14)
                .fontColor('#999999')
                .margin({ top: 5 })
            }
            .alignItems(HorizontalAlign.Start)
            .margin({ left: 20 })
            
            Blank()
            
            Text('→')
              .fontSize(24)
          }
          .width('100%')
          .padding(20)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .margin({ top: 10, bottom: 10 })

          // 订单入口
          Column() {
            Text('我的订单')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .margin({ bottom: 15 })
              .alignSelf(ItemAlign.Start)
            
            Row() {
              this.OrderTypeItem('待付款', '💰')
              this.OrderTypeItem('待发货', '📦')
              this.OrderTypeItem('待收货', '🚚')
              this.OrderTypeItem('待评价', '⭐')
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceAround)
          }
          .width('100%')
          .padding(20)
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .margin({ bottom: 10 })

          // 功能菜单
          Column() {
            this.MenuItem('地址管理', '📍')
            Divider()
            this.MenuItem('优惠券', '🎫')
            Divider()
            this.MenuItem('客服中心', '💬')
            Divider()
            this.MenuItem('设置', '⚙️')
          }
          .width('100%')
          .backgroundColor('#FFFFFF')
          .borderRadius(10)
          .margin({ bottom: 10 })

          // 退出登录按钮
          Button('退出登录')
            .width('90%')
            .height(50)
            .fontSize(16)
            .backgroundColor('#FFFFFF')
            .fontColor('#FF6600')
            .borderRadius(10)
            .margin({ top: 20, bottom: 20 })
            .onClick(() => {
              promptAction.showToast({
                message: '退出登录功能开发中',
                duration: 2000
              });
            })
        }
        .width('95%')
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder OrderTypeItem(title: string, icon: string) {
    Column() {
      Text(icon)
        .fontSize(30)
      Text(title)
        .fontSize(12)
        .margin({ top: 5 })
    }
    .onClick(() => {
      promptAction.showToast({
        message: title + '功能开发中',
        duration: 2000
      });
    })
  }

  @Builder MenuItem(title: string, icon: string) {
    Row() {
      Text(icon)
        .fontSize(24)
        .margin({ right: 15 })
      
      Text(title)
        .fontSize(16)
      
      Blank()
      
      Text('→')
        .fontSize(20)
        .fontColor('#999999')
    }
    .width('100%')
    .height(60)
    .padding({ left: 20, right: 20 })
    .onClick(() => {
      promptAction.showToast({
        message: title + '功能开发中',
        duration: 2000
      });
    })
  }
}
