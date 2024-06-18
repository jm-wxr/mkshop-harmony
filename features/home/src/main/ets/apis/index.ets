import { request } from '@mk/basic/Index'
import { ApiResult, Banner, CategoryItem, MkGoodsItem } from '../models'

export const getBannerApi = () => {
  return request<Banner[]>({
    url: 'home/banner'
  })
}

export const getCategoryApi = () => {
  return request<CategoryItem[]>({
    url: 'home/category/head'
  })
}

export const getPreferenceApi = () => {
  return request<ApiResult>({
    url: 'hot/preference'
  })
}

export const getHotApi = () => {
  return request<ApiResult>({
    url: 'hot/inVogue'
  })
}

export const getOneApi = () => {
  return request<ApiResult>({
    url: 'hot/oneStop'
  })
}

export const getNewApi = () => {
  return request<MkGoodsItem[]>({
    url: 'home/new'
  })
}

export const getRecommendApi = (limit: number = 8) => {
  return request<MkGoodsItem[]>({
    url: 'home/recommend',
    params: {
      limit
    }
  })
}