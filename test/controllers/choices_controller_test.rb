require 'test_helper'

class ChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get choices_create_url
    assert_response :success
  end

  test "should get destroy" do
    get choices_destroy_url
    assert_response :success
  end

end
