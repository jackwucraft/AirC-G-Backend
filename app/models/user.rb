class User < ApplicationRecord
  has_many :products # can
  has_many :bookings # can
  has_many :likes # can
  has_many :message_boards
  has_many :messages
end
