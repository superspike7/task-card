require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "#switch_position" do
    category = categories(:category_two)

    category.switch_position(2)

    assert_equal category.position, 2
  end
end
