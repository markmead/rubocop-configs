require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get references" do
    get pages_references_url
    assert_response :success
  end

end
