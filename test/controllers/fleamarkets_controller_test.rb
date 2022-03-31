require 'test_helper'

class FleamarketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fleamarkets_index_url
    assert_response :success
  end

end
