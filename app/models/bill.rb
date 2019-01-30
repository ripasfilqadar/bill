class Bill < ApplicationRecord
  enum tax_code: {
    food: 1,
    tobacco: 2,
    entertainment: 3
  }
end
