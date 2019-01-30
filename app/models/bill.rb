class Bill < ApplicationRecord
  enum tax_code: {
    food: 1,
    tobacco: 2,
    entertainment: 3
  }

  attr_accessor :tax_code_type

  class << self
    def tax_code_int(bill)
      tax_codes[bill.tax_code]
    end
  end

end
