require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get quiz_index_url
    assert_response :success
  end

  test "should get start" do
    get quiz_start_url
    assert_response :success
  end

  test "should get question" do
    get quiz_question_url
    assert_response :success
  end

  test "should get answer" do
    get quiz_answer_url
    assert_response :success
  end

  test "should get end" do
    get quiz_end_url
    assert_response :success
  end

end
