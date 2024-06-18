export interface MkGoodsItem {
  id: string
  name: string
  desc: string
  price: string
  picture: ResourceStr
  orderNum: number
}

export interface CategoryItem {
  children?: CategoryItemChild[]
  goods?: MkGoodsItem[]
  id: string
  name: string
  picture: ResourceStr
}

export interface CategoryItemChild {
  id: string
  name: string
  picture: ResourceStr
}

export interface Banner {
  id: string;
  imgUrl: string;
  type: string;
}


export interface Params {
  title: string,
  subTitle: string,
  bg: ResourceStr,
  list: MkGoodsItem[]
}
