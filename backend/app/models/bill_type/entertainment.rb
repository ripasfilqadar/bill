module BillType
  class Entertainment
    def initialize(bill)
      @bill = bill
      @type = 'Entertainment'
    end

    def tax
      (@bill.price < 100) ? 0 : (@bill.price - 100)/100.0
    end

    def refundable
      false
    end

    def type
      @type
    end
  end

end