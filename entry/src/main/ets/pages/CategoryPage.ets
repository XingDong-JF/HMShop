import { GetCategory, GetCategoryList } from "../api/CategoryApi";
import { BrotherCategoryModel } from "../model/BrotherCategoryModel";
import { BackBar } from "../view/BackBar";
import { CurrentCategoryModel } from "../model/CurrentCategoryModel";

@Entry
@Component
struct CategoryPage {
  @State cid: number = 1008002;
  @State page: number = 1;
  // 加载更多时添加防抖和加载状态
  @State isLoading: boolean = false;
  @State brotherCategory: Array<BrotherCategoryModel> = [];
  @State getCategoryList: Array<CurrentCategoryModel> = [];

  async aboutToAppear() {
    const params = this.getUIContext().getRouter().getParams() as Record<string, Object>;
    if (params && params.cid) {
      this.cid = params.cid as number;
    }

    const ResDataTabBar = await GetCategory(this.cid);
    this.cid=ResDataTabBar.data.currentCategory.id
    const ResDataList = await GetCategoryList(this.cid, 1, 10);
    this.brotherCategory = ResDataTabBar.data.brotherCategory;
    this.getCategoryList = ResDataList.data.list;
  }

  //切换TabBar重新渲染List事件
  async tabClickListChange(id: number) {
    this.page = 1; // 重置页码
    this.getCategoryList = []; // 清空数据
    const ResDataList = await GetCategoryList(this.cid, 1, 10);
    this.getCategoryList = ResDataList.data.list;
  }

  //滚动到底部加载更多
  async listToEnd() {
    if (this.isLoading) {
      return;
    }

    this.isLoading = true;
    try {
      const ResDataList = await GetCategoryList(this.cid, this.page + 1, 10);
      if (ResDataList.data.list.length > 0) {
        this.getCategoryList = this.getCategoryList.concat(ResDataList.data.list);
        this.page++;
      }
    } finally {
      this.isLoading = false;
    }
  }

  @Builder
  CategoryListItem(item: CurrentCategoryModel) {
    Row() {
      Column() {
        Image(item.picUrl).width(88).height(88)
      }

      Column() {
        Row() {
          Text(item.name).maxLines(1).textOverflow({ overflow: TextOverflow.Ellipsis })
        }

        Row() {
          Text(item.brief).fontColor("#646566")
        }

        Row() {
          Text() {
            Span("￥").fontSize(12)
            Span(item.retailPrice.toString()).fontSize(14)
            Span("￥" + item.counterPrice)
              .fontSize(10)
              .fontColor("#969799")
              .decoration({ type: TextDecorationType.LineThrough })
          }
        }.margin({ top: 10 })
      }.width('80%').alignItems(HorizontalAlign.Start).margin({ left: 6 })
    }
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Top }) {
        Tabs() {
          ForEach(this.brotherCategory, (item: BrotherCategoryModel) => {
            TabContent() {
              Column() {
                //简介
                Row() {
                  Column() {
                    Text(item.name)
                      .fontSize(18)
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .textAlign(TextAlign.Center)
                    Text(item.desc)
                      .margin({ top: 5 })
                      .fontSize(14)
                      .fontColor("#999")
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                      .textAlign(TextAlign.Center)
                  }.width("100%")
                }.width("100%").padding(10)

                //清单
                Row() {
                  List() {
                    ForEach(this.getCategoryList, (cur: CurrentCategoryModel) => {
                      ListItem() {
                        this.CategoryListItem(cur)
                      }.width("90%")
                    }, (cur: CurrentCategoryModel) => cur.id.toString()) // 添加唯一key
                  }.onReachEnd(() => {
                    this.listToEnd();
                  })
                  .cachedCount(3) // 添加缓存
                }
              }.width("100%")
            }.tabBar(item.name)
            .align(Alignment.Top)
          })
        }
        .margin({ top: 50 })
        .scrollable(false)
        .barMode(BarMode.Scrollable)
        // .animationMode(2)
        .onTabBarClick((index) => {
          this.cid = this.brotherCategory[index].id;
          this.tabClickListChange(this.cid)
        })

        BackBar().alignSelf(ItemAlign.Start)
      }
    }
    .height('100%')
    .width('100%')
  }
}