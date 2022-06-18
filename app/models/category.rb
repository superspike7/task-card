class Category < ApplicationRecord
  validates :name, presence: true

  has_many :tasks, -> {order(position: :asc)}, dependent: :destroy
  belongs_to :user

  acts_as_list scope: :user

  # after_create_commit :set_position
  #
  # def options
  #   self.user.categories.map { |c| c.position }
  # end
  #
  # def switch_position(target)
  #   unless self.position == target
  #     target_category = self.user.categories.find_by(position: target)
  #     target_category.update(position: self.position)
  #   end
  # end
  #
  # def set_position
  #   self.update(position: self.user.categories.count) 
  # end
end
