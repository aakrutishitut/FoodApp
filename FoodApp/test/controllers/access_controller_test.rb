require 'test_helper'

class AccessControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get access_signin_url
    assert_response :success
  end

  test "should get signup" do
    get access_signup_url
    assert_response :success
  end

  test "should get partner" do
    get access_partner_url
    assert_response :success
  end

end
