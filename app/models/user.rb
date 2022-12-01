class User < ApplicationRecord
  has_many :games # can
  # has_many :bookings # can
  has_many :likes # can
end
