class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product # can
end
