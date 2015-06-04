require 'test_helper'

class DeliveriesControllerTest < ActionController::TestCase
  setup do
    @delivery = deliveries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deliveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery" do
    assert_difference('Delivery.count') do
      post :create, delivery: { address: @delivery.address, city_id: @delivery.city_id, company_id: @delivery.company_id, date_of_delivery: @delivery.date_of_delivery, package_number: @delivery.package_number, status: @delivery.status }
    end

    assert_redirected_to delivery_path(assigns(:delivery))
  end

  test "should show delivery" do
    get :show, id: @delivery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery
    assert_response :success
  end

  test "should update delivery" do
    patch :update, id: @delivery, delivery: { address: @delivery.address, city_id: @delivery.city_id, company_id: @delivery.company_id, date_of_delivery: @delivery.date_of_delivery, package_number: @delivery.package_number, status: @delivery.status }
    assert_redirected_to delivery_path(assigns(:delivery))
  end

  test "should destroy delivery" do
    assert_difference('Delivery.count', -1) do
      delete :destroy, id: @delivery
    end

    assert_redirected_to deliveries_path
  end
end
