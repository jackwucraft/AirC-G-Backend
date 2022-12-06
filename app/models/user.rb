class User < ApplicationRecord
  has_many :products # can
  # has_many :bookings # can
  has_many :likes # can
end
