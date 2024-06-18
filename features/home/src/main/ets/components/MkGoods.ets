import { MkGoodsItem } from '../models'

@Component
export struct MkGoods {
  goods: MkGoodsItem = {} as MkGoodsItem
  smallImage: boolean = false

  build() {
    Column({ space: 10 }) {
      if (this.smallImage) {
        Row() {
          Image(this.goods.picture)
            .width('100%')
            .aspectRatio(1)
        }
        .width('100%')
        .padding(20)
      } else {
        Image(this.goods.picture)
          .width('100%')
          .aspectRatio(1)
      }
      Text(this.goods.name)
        .fontSize(14)
        .fontColor($r('app.color.text'))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .width('100%')
        .padding({ left: 10, right: 10 })
      Row({ space: 4 }) {
        Text('¥' + Number(this.goods.price))
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.black'))
        Text('¥999')
          .fontSize(8)
          .fontColor($r('app.color.gray'))
          .decoration({ type: TextDecorationType.LineThrough, color: $r('app.color.gray') })
        Blank()
        Text('2.9万+人付款')
          .fontSize(10)
          .fontColor($r('app.color.gray'))
      }
      .alignItems(VerticalAlign.Bottom)
      .width('100%')
      .margin({ bottom: 10 })
      .padding({ left: 10, right: 10 })
    }
    .width('100%')
    .backgroundColor($r('app.color.white'))
    .borderRadius(8)
    .clip(true)
  }
}