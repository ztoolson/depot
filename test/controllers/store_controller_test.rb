require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

    # Test elements on the page
    assert_select "#columns #side a", minimum: 4
    assert_select "h3", products(:valid_product).title
    assert_select ".price", /\$[,\d]+\.\d\d/
  end
end
