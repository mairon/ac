require 'test_helper'

class StandardExchangesControllerTest < ActionController::TestCase
  setup do
    @standard_exchange = standard_exchanges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:standard_exchanges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create standard_exchange" do
    assert_difference('StandardExchange.count') do
      post :create, standard_exchange: { currency_have: @standard_exchange.currency_have, currency_want: @standard_exchange.currency_want, operation: @standard_exchange.operation }
    end

    assert_redirected_to standard_exchange_path(assigns(:standard_exchange))
  end

  test "should show standard_exchange" do
    get :show, id: @standard_exchange
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @standard_exchange
    assert_response :success
  end

  test "should update standard_exchange" do
    patch :update, id: @standard_exchange, standard_exchange: { currency_have: @standard_exchange.currency_have, currency_want: @standard_exchange.currency_want, operation: @standard_exchange.operation }
    assert_redirected_to standard_exchange_path(assigns(:standard_exchange))
  end

  test "should destroy standard_exchange" do
    assert_difference('StandardExchange.count', -1) do
      delete :destroy, id: @standard_exchange
    end

    assert_redirected_to standard_exchanges_path
  end
end
