require 'test_helper'

class NameControllerTest < ActionDispatch::IntegrationTest
  test "should get listings" do
    get name_listings_url
    assert_response :success
  end

end
