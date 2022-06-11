class Category < ApplicationRecord
  has_many :tasks
  scope :ordered, -> { order(id: :asc) }
end
