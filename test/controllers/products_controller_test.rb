require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:valid_product)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)

    assert_select "table tr", minimum: products.count
    assert_select ".list_actions a", minimum: 3
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { title: "hello", description: "product", price: 5  }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { title: "hello", description: "product", price: 5  }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
