import { mediaquery } from '@kit.ArkUI'

declare interface BreakpointTypeOption<T> {
  xs?: T
  sm?: T
  md?: T
  lg?: T
}

export class BreakPointType<T> {
  options: BreakpointTypeOption<T>

  constructor(options: BreakpointTypeOption<T>) {
    this.options = options
  }

  /**
   * 根据当前断点返回所对应的值
   * @param currentBreakpoint 断点值
   * @returns 断点对应options里的值
   */
  getValue(currentBreakpoint: string) {
    switch (currentBreakpoint) {
      case 'xs':
        return this.options.xs
      case 'sm':
        return this.options.sm
      case 'md':
        return this.options.md
      case 'lg':
        return this.options.lg
      default:
        return undefined
    }
  }
}

/** 断点类型 */
interface Breakpoint {
  name: string
  size: number
  mediaQueryListener?: mediaquery.MediaQueryListener
}

/** 存储AppStorage用到的Key */
export const BreakpointKey: string = 'currentBreakpoint'

export class BreakpointSystem {
  private currentBreakpoint: string = 'md'
  private breakpoints: Breakpoint[] = [
    { name: 'xs', size: 0 },
    { name: 'sm', size: 320 },
    { name: 'md', size: 600 },
    { name: 'lg', size: 840 }
  ]

  /** 给每个断点注册监听 */
  public register() {
    this.breakpoints.forEach((breakpoint: Breakpoint, index) => {
      let condition: string // 查询条件
      if (index === this.breakpoints.length - 1) {
        condition = '(' + breakpoint.size + 'vp<=width' + ')'
      } else {
        condition = '(' + breakpoint.size + 'vp<=width<' + this.breakpoints[index + 1].size + 'vp)'
      }
      breakpoint.mediaQueryListener = mediaquery.matchMediaSync(condition)
      breakpoint.mediaQueryListener.on('change', (mediaQueryRes) => {
        if (mediaQueryRes.matches) {
          this.updateCurrentBreakpoint(breakpoint.name)
        }
      })
    })
  }

  /** 注销断点的监听 */
  public unregister() {
    this.breakpoints.forEach((breakpoint: Breakpoint) => {
      if (breakpoint.mediaQueryListener) {
        breakpoint.mediaQueryListener.off('change')
      }
    })
  }

  /**
   * 更新当前断点值
   * @param breakpoint 断点
   */
  private updateCurrentBreakpoint(breakpoint: string) {
    if (this.currentBreakpoint !== breakpoint) {
      this.currentBreakpoint = breakpoint
      AppStorage.set<string>(BreakpointKey, this.currentBreakpoint)
    }
  }
}