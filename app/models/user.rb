class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories
  has_many :tasks, through: :categories

  after_commit :set_categories, on: :create

  def set_categories
    self.categories.create(name: 'To Do')
    self.categories.create(name: 'Done')
  end

end
