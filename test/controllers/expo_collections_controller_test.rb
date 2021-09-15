require 'test_helper'

class ExpoCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get expo_collections_new_url
    assert_response :success
  end

end
