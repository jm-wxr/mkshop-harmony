import { request } from '@mk/basic/Index'
import { ApiResult, Banner, CategoryItem } from '../models'

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