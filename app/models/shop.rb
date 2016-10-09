class Shop < ApplicationRecord
  has_many :shop_places
  has_many :places, through: :shop_places
  validates :name, 
    presence: true
  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
