require 'test_helper'

class OccasionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get occasions_new_url
    assert_response :success
  end

  test "should get create" do
    get occasions_create_url
    assert_response :success
  end

  test "should get index" do
    get occasions_index_url
    assert_response :success
  end

  test "should get show" do
    get occasions_show_url
    assert_response :success
  end

  test "should get edit" do
    get occasions_edit_url
    assert_response :success
  end

  test "should get update" do
    get occasions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get occasions_destroy_url
    assert_response :success
  end

end
