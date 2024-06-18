import { CartView } from '@mk/cart/Index'
import { CategoryView } from '@mk/category/Index'
import { HomeView } from '@mk/home/Index'
import { MineView } from '@mk/mine/Index'
import { BreakpointKey, BreakpointSystem } from '@mk/basic/Index'

interface TabItem {
  text: string
  normal: ResourceStr
  active: ResourceStr
}

@Entry
@Component
struct Index {
  @State activeIndex: number = 0
  breakpointSystem: BreakpointSystem = new BreakpointSystem()
  @StorageProp(BreakpointKey) breakpoint: string = 'xs'
  list: TabItem[] = [
    { text: '首页', normal: $r('app.media.ic_public_home_normal'), active: $r('app.media.ic_public_home_active') },
    { text: '分类', normal: $r('app.media.ic_public_pro_normal'), active: $r('app.media.ic_public_pro_active') },
    { text: '购物袋', normal: $r('app.media.ic_public_cart_normal'), active: $r('app.media.ic_public_cart_active') },
    { text: '我的', normal: $r('app.media.ic_public_my_normal'), active: $r('app.media.ic_public_my_active') },
  ]

  aboutToAppear(): void {
    this.breakpointSystem.register()
  }

  aboutToDisappear(): void {
    this.breakpointSystem.unregister()
  }

  build() {
    Tabs() {
      ForEach(this.list, (item: TabItem, index: number) => {
        TabContent() {
          if (index === 0) {
            HomeView()
          } else if (index === 1) {
            CategoryView()
          } else if (index === 2) {
            CartView()
          } else if (index === 3) {
            MineView()
          }
        }
        .tabBar(this.TabItemBuilder(item, index))
      })
    }
    .vertical(this.breakpoint === 'lg')
    .barPosition(this.breakpoint === 'lg' ? BarPosition.Start : BarPosition.End)
    .scrollable(false)
    .onTabBarClick(index => {
      this.activeIndex = index
    })
  }

  @Builder
  TabItemBuilder(item: TabItem, index: number) {
    Column() {
      Image(this.activeIndex === index ? item.active : item.normal)
        .width(24)
        .aspectRatio(1)
      Text(item.text)
        .fontColor($r('app.color.black'))
        .fontSize(12)
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .height(50)
  }
}