require 'application_system_test_case'

class AuthenticationFlowsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test 'user registers an account' do
    visit root_url
    assert_current_path '/home'

    click_on 'Signup'
    assert_selector 'h2', text: 'Create an Account'

    fill_in 'Email', with: 'user1@gmail.com'
    fill_in 'Password', with: 'userpassword'
    fill_in 'Password confirmation', with: 'userpassword'
    click_on 'Sign up'

    assert_selector 'h3', text: 'Categories'
    assert_selector 'h2', text: 'user1@gmail.com'
  end

  test 'user sign in successfully' do
    user = users(:john)

    visit root_url
    assert_current_path '/home'

    click_on 'Login'
    assert_selector 'h2', text: 'Log In'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret123'
    click_on 'Log in'

    assert_selector 'h3', text: 'Categories'
    assert_selector 'h2', text: user.email
  end
 
  test 'user logs out succesfully' do
    user = users(:john)
    sign_in user
    visit root_url

    assert_selector 'h3', text: 'Categories'
    assert_selector 'h2', text: user.email

    click_on "Logout"
    assert_current_path '/home'
    assert_selector 'h1', text: 'TASKCARD'
  end

end
