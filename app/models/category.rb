class Category < ApplicationRecord
  validates :name, presence: true

  has_many :tasks
  belongs_to :user

  scope :ordered, -> { order(id: :asc) }
end
