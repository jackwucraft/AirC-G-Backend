class Exchange < ApplicationRecord
  belongs_to :game_provided, class_name: "product"
  # belongs_to :game_received, class_name: "product"
end
