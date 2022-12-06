class MessageBoard < ApplicationRecord
  belongs_to :product
  belongs_to :viewer, class_name: "user"
  has_many :messages
end
