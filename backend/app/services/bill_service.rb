
  class BillService
    def serialize_bill(bill)
      bill.tax_code_type = bill.tax_code.camelize.constantize.new bill
      {
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

  class Food
    def initialize(bill)
      @bill = bill
      @type = 'Food & Beverage'
    end

    def tax
      @bill.price / 10
    end

    def refundable
      true
    end

    def type
      @type
    end
  end

  class Tobacco
    def initialize(bill)
      @bill = bill
      @type = 'Tobacco'
    end

    def tax
      (@bill.price*0.02) + 10
    end

    def refundable
      false
    end

    def type
      @type
    end
  end

  class Entertainment
    def initialize(bill)
      @bill = bill
      @type = 'Entertainment'
    end

    def tax
      (@bill.price < 100) ? 0 : (@bill.price - 100)/100
    end

    def refundable
      false
    end

    def type
      @type
    end
  end
