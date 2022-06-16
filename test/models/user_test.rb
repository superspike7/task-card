require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "create default categories after create" do
    email = 'dave@example.com'
    password = 'secret123'

    user = User.new(email: email, password: password, password_confirmation: password)
    user.save!

    assert User.find(user.id)
    assert user.categories.find_by(name: 'To Do')
    assert user.categories.find_by(name: 'Done')
  end
end
