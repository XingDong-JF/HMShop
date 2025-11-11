import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { DataService } from '../utils/DataService';
import { CartItem } from '../models/Models';

@Entry
@Component
struct Cart {
  @State cartItems: CartItem[] = [];
  @State total: number = 0;

  aboutToAppear() {
    this.refreshCart();
  }

  refreshCart() {
    this.cartItems = DataService.getCartItems();
    this.total = DataService.getCartTotal();
  }

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
        
        Text('购物车')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        
        Blank()
        
        Text('清空')
          .fontSize(16)
          .fontColor('#FF6600')
          .onClick(() => {
            DataService.clearCart();
            this.refreshCart();
            promptAction.showToast({
              message: '购物车已清空',
              duration: 2000
            });
          })
      }
      .width('100%')
      .height(60)
      .padding({ left: 20, right: 20 })
      .backgroundColor('#FFFFFF')

      if (this.cartItems.length > 0) {
        // 购物车商品列表
        List() {
          ForEach(this.cartItems, (item: CartItem, index: number) => {
            ListItem() {
              Row() {
                Text('📷')
                  .fontSize(60)
                  .width(80)
                  .height(80)
                  .textAlign(TextAlign.Center)
                  .backgroundColor('#F5F5F5')
                  .borderRadius(10)
                
                Column() {
                  Text(item.product.name)
                    .fontSize(16)
                    .fontWeight(FontWeight.Bold)
                    .maxLines(2)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                  
                  Text('¥' + item.product.price)
                    .fontSize(18)
                    .fontColor('#FF6600')
                    .fontWeight(FontWeight.Bold)
                    .margin({ top: 5 })
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
                .margin({ left: 15 })
                
                Column() {
                  Row() {
                    Text('-')
                      .fontSize(20)
                      .width(30)
                      .height(30)
                      .textAlign(TextAlign.Center)
                      .backgroundColor('#F5F5F5')
                      .borderRadius(5)
                      .onClick(() => {
                        DataService.updateCartItemQuantity(item.product.id, item.quantity - 1);
                        this.refreshCart();
                      })
                    
                    Text(item.quantity.toString())
                      .fontSize(16)
                      .width(40)
                      .textAlign(TextAlign.Center)
                    
                    Text('+')
                      .fontSize(20)
                      .width(30)
                      .height(30)
                      .textAlign(TextAlign.Center)
                      .backgroundColor('#F5F5F5')
                      .borderRadius(5)
                      .onClick(() => {
                        if (item.quantity < item.product.stock) {
                          DataService.updateCartItemQuantity(item.product.id, item.quantity + 1);
                          this.refreshCart();
                        } else {
                          promptAction.showToast({
                            message: '超过库存数量',
                            duration: 2000
                          });
                        }
                      })
                  }
                  
                  Text('删除')
                    .fontSize(14)
                    .fontColor('#FF6600')
                    .margin({ top: 10 })
                    .onClick(() => {
                      DataService.removeFromCart(item.product.id);
                      this.refreshCart();
                      promptAction.showToast({
                        message: '已删除',
                        duration: 2000
                      });
                    })
                }
                .alignItems(HorizontalAlign.End)
              }
              .width('100%')
              .padding(15)
              .backgroundColor('#FFFFFF')
              .borderRadius(10)
            }
            .margin({ bottom: 10 })
          })
        }
        .width('95%')
        .layoutWeight(1)
        .margin({ top: 10 })

        // 底部结算栏
        Column() {
          Row() {
            Column() {
              Text('总计')
                .fontSize(14)
                .fontColor('#999999')
              Text('¥' + this.total.toFixed(2))
                .fontSize(24)
                .fontColor('#FF6600')
                .fontWeight(FontWeight.Bold)
            }
            .alignItems(HorizontalAlign.Start)
            
            Blank()
            
            Button('去结算 (' + DataService.getCartItemCount() + ')')
              .width(150)
              .height(50)
              .fontSize(16)
              .backgroundColor('#FF6600')
              .borderRadius(25)
              .onClick(() => {
                promptAction.showToast({
                  message: '结算功能开发中',
                  duration: 2000
                });
              })
          }
          .width('100%')
          .padding({ left: 20, right: 20 })
        }
        .width('100%')
        .height(100)
        .backgroundColor('#FFFFFF')
      } else {
        // 空购物车
        Column() {
          Text('🛒')
            .fontSize(80)
            .margin({ bottom: 20 })
          
          Text('购物车为空')
            .fontSize(18)
            .fontColor('#999999')
            .margin({ bottom: 30 })
          
          Button('去逛逛')
            .width(150)
            .height(45)
            .fontSize(16)
            .backgroundColor('#FF6600')
            .borderRadius(25)
            .onClick(() => {
              router.back();
            })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
