class Message < ApplicationRecord
  belongs_to :sender, class_name: "user"
  belongs_to :message_board
end
