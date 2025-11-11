import { BannerModel } from "../model/BannerModel"
import { ChannelModel } from "../model/ChannelModel"
import { CouponListModel } from "../model/CouponListModel"
import { NewGoodsListModel } from "../model/NewGoodsListModel"
import { GrouponListModel } from "../model/GrouponListModel"
import { BrandListModel } from "../model/BrandListModel"
import { HotGoodsListModel } from "../model/HotGoodsListModel"
import { TopicListModel } from "../model/TopicListModel"

export interface HomeViewData {
  banner: Array<BannerModel>
  channel: Array<ChannelModel>
  couponList: Array<CouponListModel>
  newGoodsList: Array<NewGoodsListModel>
  grouponList: Array<GrouponListModel>
  brandList: Array<BrandListModel>
  hotGoodsList: Array<HotGoodsListModel>
  topicList: Array<TopicListModel>
}