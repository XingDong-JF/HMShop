import router from '@ohos.router';
import { DataService } from '../utils/DataService';
import { Product } from '../models/Models';

@Entry
@Component
struct Index {
  @State selectedTab: number = 0;
  private categories: string[] = DataService.getCategories();

  build() {
    Column() {
      // 顶部搜索栏
      Row() {
        Text('鸿蒙商城')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF6600')
        
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

      // 搜索框
      Row() {
        TextInput({ placeholder: '搜索商品' })
          .width('100%')
          .height(40)
          .backgroundColor('#F5F5F5')
          .borderRadius(20)
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 10, bottom: 10 })
      .backgroundColor('#FFFFFF')

      Tabs({ barPosition: BarPosition.End }) {
        // 首页
        TabContent() {
          this.HomeContent()
        }
        .tabBar(this.TabBuilder(0, '首页', '🏠'))

        // 分类
        TabContent() {
          this.CategoryContent()
        }
        .tabBar(this.TabBuilder(1, '分类', '📋'))

        // 购物车
        TabContent() {
          this.CartTab()
        }
        .tabBar(this.TabBuilder(2, '购物车', '🛒'))

        // 我的
        TabContent() {
          this.ProfileTab()
        }
        .tabBar(this.TabBuilder(3, '我的', '👤'))
      }
      .width('100%')
      .height('100%')
      .barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.selectedTab = index;
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  @Builder TabBuilder(index: number, name: string, icon: string) {
    Column() {
      Text(icon)
        .fontSize(24)
      Text(name)
        .fontSize(12)
        .fontColor(this.selectedTab === index ? '#FF6600' : '#999999')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder HomeContent() {
    Scroll() {
      Column() {
        // 轮播图区域
        Text('🎉 欢迎来到鸿蒙商城')
          .width('90%')
          .height(150)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Center)
          .backgroundColor('#FF6600')
          .fontColor('#FFFFFF')
          .borderRadius(10)
          .margin({ top: 10, bottom: 10 })

        // 商品分类快捷入口
        Text('商品分类')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        Grid() {
          ForEach(this.categories, (category: string) => {
            GridItem() {
              Column() {
                Text('📦')
                  .fontSize(40)
                Text(category)
                  .fontSize(14)
                  .margin({ top: 5 })
              }
              .width('100%')
              .height(100)
              .backgroundColor('#FFFFFF')
              .borderRadius(10)
              .justifyContent(FlexAlign.Center)
              .onClick(() => {
                router.pushUrl({
                  url: 'pages/ProductList',
                  params: { category: category }
                });
              })
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .width('90%')
        .height(220)

        // 推荐商品
        Text('推荐商品')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20, bottom: 10 })
          .alignSelf(ItemAlign.Start)
          .margin({ left: 20 })

        this.ProductGrid(DataService.getAllProducts())
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }

  @Builder CategoryContent() {
    Column() {
      List() {
        ForEach(this.categories, (category: string) => {
          ListItem() {
            Row() {
              Text('📦')
                .fontSize(30)
                .margin({ right: 15 })
              Text(category)
                .fontSize(16)
              Blank()
              Text('→')
                .fontSize(20)
            }
            .width('100%')
            .height(60)
            .padding({ left: 20, right: 20 })
            .backgroundColor('#FFFFFF')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/ProductList',
                params: { category: category }
              });
            })
          }
          .margin({ bottom: 10 })
        })
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .padding({ top: 10 })
  }

  @Builder CartTab() {
    Column() {
      Button('查看购物车详情')
        .width('80%')
        .height(50)
        .fontSize(16)
        .backgroundColor('#FF6600')
        .borderRadius(25)
        .margin({ top: 50 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/Cart' });
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder ProfileTab() {
    Column() {
      Button('查看个人中心')
        .width('80%')
        .height(50)
        .fontSize(16)
        .backgroundColor('#FF6600')
        .borderRadius(25)
        .margin({ top: 50 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/Profile' });
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  @Builder ProductGrid(products: Product[]) {
    Grid() {
      ForEach(products, (product: Product) => {
        GridItem() {
          Column() {
            Text('📷')
              .fontSize(60)
              .margin({ top: 20 })
            
            Text(product.name)
              .fontSize(14)
              .maxLines(2)
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .margin({ top: 10, left: 10, right: 10 })
            
            Text('¥' + product.price)
              .fontSize(16)
              .fontColor('#FF6600')
              .fontWeight(FontWeight.Bold)
              .margin({ top: 5, bottom: 10 })
          }
          .width('100%')
          .height(200)
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
    .width('90%')
    .margin({ bottom: 20 })
  }
}
