module BillType
  class Tobacco
    def initialize(bill)
      @bill = bill
      @type = 'Tobacco'
    end

    def tax
      (@bill.price*0.02) + 10.0
    end

    def refundable
      false
    end

    def type
      @type
    end
  end
end