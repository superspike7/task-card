require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  test "create new category" do
    visit root_url 

    click_on "New Category"

    fill_in "Name", with: "To Do"

    click_on "Create Category"

    assert_selector "p", text: "Category Successfully Created!"
  end
end
