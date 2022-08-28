require 'test_helper'

class CollocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get collocations_new_url
    assert_response :success
  end

  test "should get create" do
    get collocations_create_url
    assert_response :success
  end

  test "should get index" do
    get collocations_index_url
    assert_response :success
  end

  test "should get show" do
    get collocations_show_url
    assert_response :success
  end

  test "should get edit" do
    get collocations_edit_url
    assert_response :success
  end

  test "should get update" do
    get collocations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get collocations_destroy_url
    assert_response :success
  end

end
