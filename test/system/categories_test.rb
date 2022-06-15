require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  setup do
    sign_in users(:john)
  end

  test 'create new category' do
    visit root_url
    assert_selector 'h3', text: 'Categories'

    click_on 'New Category'

    fill_in 'Name', with: 'To Do'

    click_on 'Create Category'

    assert_selector 'p', text: 'Category Successfully Created!'
    assert_selector 'h2', text: 'To Do'
  end

  test 'edit existing category' do
    visit root_url
    assert_selector 'h3', text: 'Categories'

    click_on 'edit', match: :first
    assert_selector 'label', text: 'Name'

    fill_in 'Name', with: 'Edited Name'

    click_on 'Update Category'

    assert_selector 'p', text: 'Category Successfully Updated!'
    assert_selector 'h2', text: 'Edited Name'
  end

  test 'show category details' do
    visit root_url
    assert_selector 'h3', text: 'Categories'

    click_on 'Done'

    assert_selector 'h1', text: 'Done Details'
  end
end
