require 'application_system_test_case'

class AuthenticationFlowsTest < ApplicationSystemTestCase
  test 'user registers an account' do
    visit root_url
    assert_current_path '/home'

    click_on 'Register'
    assert_selector 'h1', text: 'Create an Account'

    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'userpassword'
    fill_in 'Password Confirmation', with: 'userpassword'
    click_on 'Register Account'

    assert_selector 'h3', text: 'Categories'
    assert_selector 'h2', text: 'user1@gmail.com'
  end
end
