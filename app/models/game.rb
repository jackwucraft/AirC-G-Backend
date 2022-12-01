class Game < ApplicationRecord
  belongs_to :user
  # belongs_to :booking # can
  has_many :likes # can
end
