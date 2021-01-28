require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: 'Gzim')
  end

  test 'should create user' do
    assert_difference('User.count', 0) do
      post users_url, params: { user: { username: @user.username } }
    end
  end

  test 'should get new' do
    get signup_url
    assert_response :success
  end
end
