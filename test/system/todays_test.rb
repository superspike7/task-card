require 'application_system_test_case'

class TodaysTest < ApplicationSystemTestCase
  setup do
    sign_in users(:john)
  end

  test "user can view today's tasks page" do
    visit today_url

    assert_selector 'h1', text: 'Tasks for today!'
    assert_selector 'h3', text: 'Category CRUD'
    assert_selector 'h3', text: 'Task CRUD'
    assert_selector 'h3', text: 'Authentication'
  end

  test "user can delete a task in the today's task page" do
    task = tasks(:task_two) # Category CRUD task

    visit today_url

    assert_selector 'h1', text: 'Tasks for today!'
    assert_selector 'h3', text: 'Category CRUD'

    within "li#todo_task_#{task.id}" do
      click_on 'Delete'
    end
    accept_confirm 'Are you Sure?'

    refute_selector 'h3', text: 'Category CRUD'
  end

  test "user can complete a task in the today's task page" do
    task = tasks(:task_two) # Category CRUD task
    done_category = categories(:category_two)

    visit today_url

    assert_selector 'h1', text: 'Tasks for today!'
    assert_selector 'h3', text: 'Category CRUD'

    within "li#todo_task_#{task.id}" do
      click_on 'Done'
    end

    assert_selector 'p', text: 'Task Successfully Updated!'
    refute_selector 'h3', text: 'Category CRUD'
    assert done_category.tasks.find(task.id)
  end

end
