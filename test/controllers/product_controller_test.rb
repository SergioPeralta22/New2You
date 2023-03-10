require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get products_path
    assert_response :success
    assert_select '.product', 2 # 2 products in fixtures
  end

  test 'should render a detailed product page' do
    get product_path(products(:PS5))
    assert_response :success
    assert_select 'h1', products(:PS5).title
  end

  test 'should get new' do
    get new_product_path
    assert_response :success
  end

  test 'should create a new product' do
    assert_difference('Product.count') do
      post products_path, params: { product: { title: 'PS5', description: 'The new PS5', price: 500 } }
    end

    assert_redirected_to products_path
  end

  test 'should not create a new product with invalid data' do
    assert_no_difference('Product.count') do
      post products_path, params: { product: { title: 'PS5', description: 'The new PS5', price: -1 } }
    end

    assert_response :unprocessable_entity
  end

  test 'should get edit' do
    get edit_product_path(products(:PS5))
    assert_response :success
  end

  test 'should update a product' do
    patch product_path(products(:PS5)), params: { product: { title: 'PS5', description: 'The new PS5', price: 500 } }
    assert_redirected_to products_path
  end

  test 'should not update a product with invalid data' do
    patch product_path(products(:PS5)), params: { product: { title: 'PS5', description: 'The new PS5', price: -1 } }
    assert_response :unprocessable_entity
  end

  test 'should delete a product' do
    assert_difference('Product.count', -1) do
      delete product_path(products(:PS5))
    end

    assert_redirected_to products_path
  end
end
