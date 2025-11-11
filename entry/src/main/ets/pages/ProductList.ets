import router from '@ohos.router';
import { DataService } from '../utils/DataService';
import { Product } from '../models/Models';

@Entry
@Component
struct ProductList {
  @State products: Product[] = [];
  private category: string = '';

  aboutToAppear() {
    // 获取路由参数
    const params = router.getParams() as Record<string, Object>;
    if (params && params.category) {
      this.category = params.category as string;
      this.products = DataService.getProductsByCategory(this.category);
    } else {
      this.products = DataService.getAllProducts();
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
        
        Text(this.category || '所有商品')
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

      // 商品列表
      Scroll() {
        Grid() {
          ForEach(this.products, (product: Product) => {
            GridItem() {
              Column() {
                Text('📷')
                  .fontSize(80)
                  .margin({ top: 20 })
                
                Text(product.name)
                  .fontSize(14)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .margin({ top: 10, left: 10, right: 10 })
                
                Text(product.description)
                  .fontSize(12)
                  .fontColor('#999999')
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .margin({ left: 10, right: 10, top: 5 })
                
                Row() {
                  Text('¥' + product.price)
                    .fontSize(18)
                    .fontColor('#FF6600')
                    .fontWeight(FontWeight.Bold)
                  
                  Blank()
                  
                  Text('库存:' + product.stock)
                    .fontSize(12)
                    .fontColor('#999999')
                }
                .width('100%')
                .padding({ left: 10, right: 10, top: 5, bottom: 10 })
              }
              .width('100%')
              .height(240)
              .backgroundColor('#FFFFFF')
              .borderRadius(10)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/ProductDetail',
                  params: { productId: product.id }
                });
              })
            }
          })
        }
        .columnsTemplate('1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .width('95%')
        .margin({ top: 10, bottom: 20 })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
