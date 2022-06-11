require 'application_system_test_case'

class CategoriesTest < ApplicationSystemTestCase
  test 'create task on a specific category' do
    category = categories(:one)
    task = tasks(:one)

    visit root_url
    assert_selector 'h3', text: 'Categories'

    within "div#category_#{category.id}" do
      click_on 'Add Task'
    end
    assert_selector 'h1', text: 'Create New Task'

    fill_in 'Title', with: task.title
    fill_in 'Description', with: task.description

    click_on 'Create Task'

    assert_selector 'p', text: 'Task Successfully Created!'

    assert_selector 'h3', text: task.title
    assert_selector 'p', text: task.description
  end

end
