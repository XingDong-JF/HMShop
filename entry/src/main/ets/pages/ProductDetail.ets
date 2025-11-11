import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { DataService } from '../utils/DataService';
import { Product } from '../models/Models';

@Entry
@Component
struct ProductDetail {
  @State product: Product | undefined = undefined;
  @State quantity: number = 1;

  aboutToAppear() {
    // 获取路由参数
    const params = router.getParams() as Record<string, Object>;
    if (params && params.productId) {
      const productId = params.productId as number;
      this.product = DataService.getProductById(productId);
    }
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
        
        Text('商品详情')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        
        Blank()
        
        Text('🛒 ' + DataService.getCartItemCount())
          .fontSize(18)
          .onClick(() => {
            router.pushUrl({ url: 'pages/Cart' });
          })
      }
      .width('100%')
      .height(60)
      .padding({ left: 20, right: 20 })
      .backgroundColor('#FFFFFF')

      if (this.product) {
        Scroll() {
          Column() {
            // 商品图片
            Text('📷')
              .fontSize(120)
              .width('100%')
              .height(300)
              .textAlign(TextAlign.Center)
              .backgroundColor('#FFFFFF')
              .margin({ bottom: 10 })

            // 商品信息
            Column() {
              Text(this.product.name)
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 10 })
              
              Text(this.product.description)
                .fontSize(14)
                .fontColor('#666666')
                .margin({ bottom: 15 })
              
              Row() {
                Text('¥')
                  .fontSize(16)
                  .fontColor('#FF6600')
                Text(this.product.price.toString())
                  .fontSize(28)
                  .fontColor('#FF6600')
                  .fontWeight(FontWeight.Bold)
              }
              .margin({ bottom: 15 })

              Row() {
                Text('库存: ' + this.product.stock)
                  .fontSize(14)
                  .fontColor('#999999')
                
                Blank()
                
                Text('分类: ' + this.product.category)
                  .fontSize(14)
                  .fontColor('#999999')
              }
              .width('100%')
            }
            .width('100%')
            .padding(20)
            .backgroundColor('#FFFFFF')
            .margin({ bottom: 10 })

            // 购买数量选择
            Column() {
              Row() {
                Text('购买数量')
                  .fontSize(16)
                
                Blank()
                
                Row() {
                  Text('-')
                    .fontSize(24)
                    .width(40)
                    .height(40)
                    .textAlign(TextAlign.Center)
                    .backgroundColor('#F5F5F5')
                    .borderRadius(5)
                    .onClick(() => {
                      if (this.quantity > 1) {
                        this.quantity--;
                      }
                    })
                  
                  Text(this.quantity.toString())
                    .fontSize(18)
                    .width(60)
                    .textAlign(TextAlign.Center)
                  
                  Text('+')
                    .fontSize(24)
                    .width(40)
                    .height(40)
                    .textAlign(TextAlign.Center)
                    .backgroundColor('#F5F5F5')
                    .borderRadius(5)
                    .onClick(() => {
                      if (this.quantity < this.product.stock) {
                        this.quantity++;
                      } else {
                        promptAction.showToast({
                          message: '超过库存数量',
                          duration: 2000
                        });
                      }
                    })
                }
              }
              .width('100%')
            }
            .width('100%')
            .padding(20)
            .backgroundColor('#FFFFFF')
            .margin({ bottom: 10 })

            // 商品详情说明
            Column() {
              Text('商品详情')
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .margin({ bottom: 15 })
              
              Text('这是一款优质的商品，质量可靠，性能出色。采用先进技术打造，为您带来卓越的使用体验。')
                .fontSize(14)
                .fontColor('#666666')
                .lineHeight(24)
            }
            .width('100%')
            .padding(20)
            .backgroundColor('#FFFFFF')
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
        }
        .width('100%')
        .layoutWeight(1)

        // 底部操作栏
        Row() {
          Button('加入购物车')
            .width('45%')
            .height(50)
            .fontSize(16)
            .backgroundColor('#FFA500')
            .borderRadius(25)
            .onClick(() => {
              DataService.addToCart(this.product!, this.quantity);
              promptAction.showToast({
                message: '已添加到购物车',
                duration: 2000
              });
            })
          
          Button('立即购买')
            .width('45%')
            .height(50)
            .fontSize(16)
            .backgroundColor('#FF6600')
            .borderRadius(25)
            .onClick(() => {
              DataService.addToCart(this.product!, this.quantity);
              router.pushUrl({ url: 'pages/Cart' });
            })
        }
        .width('100%')
        .height(80)
        .padding({ left: 20, right: 20 })
        .backgroundColor('#FFFFFF')
        .justifyContent(FlexAlign.SpaceBetween)
      } else {
        Column() {
          Text('商品不存在')
            .fontSize(18)
            .fontColor('#999999')
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
