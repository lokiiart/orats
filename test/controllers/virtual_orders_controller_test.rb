require 'test_helper'

class VirtualOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @virtual_order = virtual_orders(:one)
  end

  test "should get index" do
    get virtual_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_virtual_order_url
    assert_response :success
  end

  test "should create virtual_order" do
    assert_difference('VirtualOrder.count') do
      post virtual_orders_url, params: { virtual_order: { address: @virtual_order.address, name: @virtual_order.name, payment: @virtual_order.payment, phone: @virtual_order.phone, product_count: @virtual_order.product_count } }
    end

    assert_redirected_to virtual_order_url(VirtualOrder.last)
  end

  test "should show virtual_order" do
    get virtual_order_url(@virtual_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_virtual_order_url(@virtual_order)
    assert_response :success
  end

  test "should update virtual_order" do
    patch virtual_order_url(@virtual_order), params: { virtual_order: { address: @virtual_order.address, name: @virtual_order.name, payment: @virtual_order.payment, phone: @virtual_order.phone, product_count: @virtual_order.product_count } }
    assert_redirected_to virtual_order_url(@virtual_order)
  end

  test "should destroy virtual_order" do
    assert_difference('VirtualOrder.count', -1) do
      delete virtual_order_url(@virtual_order)
    end

    assert_redirected_to virtual_orders_url
  end
end
