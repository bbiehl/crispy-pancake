class Book < ApplicationRecord
  monetize :price_cents, allow_nil: true
  validates :name,  presence: true,
                    uniqueness: true
  validates :price, presence: true
end
