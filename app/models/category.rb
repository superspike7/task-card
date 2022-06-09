class Category < ApplicationRecord
  scope :ordered, -> { order(id: :desc) }
end
