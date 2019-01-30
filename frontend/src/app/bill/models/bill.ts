export class Bill{
  id: number
  name: string
  tax_code: number
  type: string
  refundable: string
  price: number
  tax: number
  amount: number
}

export class BillsData{
  bills: Bill[]
  price_sub_total: number
  tax_sub_total: number
  total: number
}