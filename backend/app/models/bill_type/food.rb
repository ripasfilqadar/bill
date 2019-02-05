module BillType
  class Food
    def initialize(bill)
      @bill = bill
      @type = 'Food & Beverage'
    end

    def tax
      @bill.price / 10.0
    end

    def refundable
      true
    end

    def type
      @type
    end
  end
end