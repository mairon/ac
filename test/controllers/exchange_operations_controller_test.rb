require 'test_helper'

class ExchangeOperationsControllerTest < ActionController::TestCase
  setup do
    @exchange_operation = exchange_operations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exchange_operations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exchange_operation" do
    assert_difference('ExchangeOperation.count') do
      post :create, exchange_operation: { amount: @exchange_operation.amount, exchange_id: @exchange_operation.exchange_id, have_id: @exchange_operation.have_id, operation: @exchange_operation.operation, want_id: @exchange_operation.want_id }
    end

    assert_redirected_to exchange_operation_path(assigns(:exchange_operation))
  end

  test "should show exchange_operation" do
    get :show, id: @exchange_operation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exchange_operation
    assert_response :success
  end

  test "should update exchange_operation" do
    patch :update, id: @exchange_operation, exchange_operation: { amount: @exchange_operation.amount, exchange_id: @exchange_operation.exchange_id, have_id: @exchange_operation.have_id, operation: @exchange_operation.operation, want_id: @exchange_operation.want_id }
    assert_redirected_to exchange_operation_path(assigns(:exchange_operation))
  end

  test "should destroy exchange_operation" do
    assert_difference('ExchangeOperation.count', -1) do
      delete :destroy, id: @exchange_operation
    end

    assert_redirected_to exchange_operations_path
  end
end
