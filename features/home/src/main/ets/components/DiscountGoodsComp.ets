import { MkGoodsItem } from '../models'

export enum DiscountType {
  COMMAND,
  DISCOUNT,
  NEW
}

@Component
export struct DiscountGoodsComp {
  @Prop type: DiscountType = DiscountType.COMMAND
  goods: MkGoodsItem = {} as MkGoodsItem

  @Builder
  CommandBuilder() {
    Column() {
      Image(this.goods.picture)
        .width(70)
        .aspectRatio(1)
      Row() {
        Stack() {
          Polygon()
            .width(16)
            .height(20)
            .points([[0, 0], [4, 0], [7, 10], [4, 20], [0, 20]])
            .fill('#FFFFFF')
          Polygon()
            .width(16)
            .height(20)
            .points([[4, 0], [12, 0], [9, 6], [16, 6], [4, 20], [7, 10], [0, 10]])
            .fill('#FFC060')
        }
        .offset({ x: -1 })

        Text('¥' + Number(this.goods.price))
          .fontSize(12)
          .fontWeight(500)
          .fontColor($r('app.color.white'))
          .textAlign(TextAlign.Center)
          .width(40)
      }
      .width(60)
      .height(20)
      .linearGradient({
        angle: 135,
        colors: [['#FD3F8F', 0], ['#FF773C', 1]]
      })
      .borderRadius({
        topRight: 10,
        bottomRight: 10
      })
    }
    .width(74)
    .height(116)
    .padding({ top: 8, bottom: 8 })
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder
  DiscountBuilder() {
    Column({ space: 8 }) {
      Image(this.goods.picture)
        .width(54)
        .aspectRatio(1)
      Text('¥' + Number(this.goods.price))
        .fontSize(12)
        .fontColor('#FF4B61')
        .fontWeight(500)
      Stack({ alignContent: Alignment.Top }) {
        Image($r('app.media.home_goods_discount'))
          .width(48)
          .height(20)
        Text('立减 90')
          .fontSize(8)
          .fontColor($r('app.color.white'))
          .lineHeight(12)
      }
    }
    .width(70)
    .height(116)
    .justifyContent(FlexAlign.Center)
  }

  @Builder
  NewBuilder() {
    Column() {
      Image(this.goods.picture)
        .width(60)
        .aspectRatio(1)
      Text('¥' + Number(this.goods.price))
        .fontSize(13)
        .lineHeight(30)
        .fontColor('#FF4B61')
        .fontWeight(500)
    }
    .padding(8)
    .width(80)
    .height(106)
    .borderRadius(8)
    .backgroundColor($r('app.color.white'))
    .justifyContent(FlexAlign.Center)
  }

  build() {
    if (this.type === DiscountType.DISCOUNT) {
      this.DiscountBuilder()
    } else if (this.type === DiscountType.NEW) {
      this.NewBuilder()
    } else {
      this.CommandBuilder()
    }
  }
}