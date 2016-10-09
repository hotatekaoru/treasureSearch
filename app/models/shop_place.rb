class ShopPlace < ApplicationRecord
  belongs_to :shop
  belongs_to :place
end
