
  class BillService
    def serialize_bill(bill)
      bill.tax_code_type = "BillType::#{bill.tax_code.camelize}".constantize.new bill
      {
        id: bill.id,
        name: bill.name,
        tax_code: Bill.tax_code_int(bill),
        type: bill.tax_code_type.type,
        refundable: bill.tax_code_type.refundable ? 'Yes' : 'No',
        price: bill.price,
        tax: bill.tax_code_type.tax,
        amount: bill.tax_code_type.tax + bill.price
      }
    end

    def serialize_bills(bills)
      price_sub_total = 0
      tax_sub_total = 0
      result_bills = []
      bills.each do |bill|
        result_bill = serialize_bill bill
        price_sub_total += result_bill[:price]
        tax_sub_total += result_bill[:tax]
        result_bills.push result_bill
      end

      {
        bills: result_bills,
        price_sub_total: price_sub_total,
        tax_sub_total: tax_sub_total,
        total: price_sub_total + tax_sub_total
      }
    end

  end
