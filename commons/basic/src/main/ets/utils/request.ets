import { Log } from '@abner/log';
import axios, { AxiosError, AxiosRequestConfig, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios';
import { promptAction } from '@kit.ArkUI';

export const axiosInstance = axios.create({
  baseURL: 'https://meikou-api.itheima.net/', // 基地址
  timeout: 5000 // 超时，ms
})

axiosInstance.interceptors.request.use((config: InternalAxiosRequestConfig) => {
  // 对请求数据做点什么
  Log.info(`1-请求配置${config.method!}-${config.url}:${JSON.stringify(config.params || config.data)}`)
  return config;
}, (error: AxiosError) => {
  // 对请求错误做些什么
  Log.error('3-http请求错误：' + JSON.stringify(error))
  return Promise.reject(error);
});

axiosInstance.interceptors.response.use((response: AxiosResponse) => {
  // 对响应数据做点什么
  // response.data.code 存在且不为 200 时，返回错误结果
  if (response.data?.code && response.data.code !== '1') {
    promptAction.showToast({
      // 响应的消息，msg根据后端返回的数据确定
      message: response.data?.msg
    })
    Log.error('3-code响应错误：' + JSON.stringify(response.data))
    return Promise.reject(response.data)
  }
  Log.warn('2-响应成功结果：' + JSON.stringify(response.data))
  // 简化数据返回，data根据后端返回的数据类型来确定
  return response.data?.result;
}, (error: AxiosError) => {
  promptAction.showToast({ message: error.response?.status + '：' + error.message })
  Log.error('3-http响应错误：' + JSON.stringify(error))
  // 对响应错误做点什么
  return Promise.reject(error);
});

export function request<DataModel = null, DataParams = null>(config: AxiosRequestConfig<DataParams>): Promise<DataModel> {
  return axiosInstance<null, DataModel>(config)
}