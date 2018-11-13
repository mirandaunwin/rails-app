class Order < ApplicationRecord
  belongs_to :products, optional: true
end
