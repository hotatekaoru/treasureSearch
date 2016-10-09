class Place < ApplicationRecord
  has_many :shop_places
  has_many :shops, through: :shop_places
end
