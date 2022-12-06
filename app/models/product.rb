class Product < ApplicationRecord
  belongs_to :user
  # has_one :booking # can
  has_many :likes # can
end
