class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user

  scope :ordered, -> { order(id: :asc) }
end
