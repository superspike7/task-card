require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  test "create new category" do
    visit root_url 

    click_on "New Category"

    fill_in "name", with: "To Do"

    click_on "Submit"

    assert_selector "p", text: "Category Successfully Created!"
  end
end
