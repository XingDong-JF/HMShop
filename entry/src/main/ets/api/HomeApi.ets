import { HttpRequest } from "../utils/HttpRequest"
import { ResponseData } from "../utils/ResponseData"
import { HomeViewData } from "../viewmodel/HomeViewData"

export const GetHome = (): Promise<ResponseData<HomeViewData>> => {
  return HttpRequest({
    url: "/wx/home/index",
    method: "get"
  })
}