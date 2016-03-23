require 'test_helper'

class ProdorcarealizadosControllerTest < ActionController::TestCase
  setup do
    @prodorcarealizado = prodorcarealizados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prodorcarealizados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prodorcarealizado" do
    assert_difference('Prodorcarealizado.count') do
      post :create, prodorcarealizado: { flag_produtoemfalta: @prodorcarealizado.flag_produtoemfalta, porcentagemdesconto: @prodorcarealizado.porcentagemdesconto, valor: @prodorcarealizado.valor, valor_desconto: @prodorcarealizado.valor_desconto, valor_total: @prodorcarealizado.valor_total }
    end

    assert_redirected_to prodorcarealizado_path(assigns(:prodorcarealizado))
  end

  test "should show prodorcarealizado" do
    get :show, id: @prodorcarealizado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prodorcarealizado
    assert_response :success
  end

  test "should update prodorcarealizado" do
    patch :update, id: @prodorcarealizado, prodorcarealizado: { flag_produtoemfalta: @prodorcarealizado.flag_produtoemfalta, porcentagemdesconto: @prodorcarealizado.porcentagemdesconto, valor: @prodorcarealizado.valor, valor_desconto: @prodorcarealizado.valor_desconto, valor_total: @prodorcarealizado.valor_total }
    assert_redirected_to prodorcarealizado_path(assigns(:prodorcarealizado))
  end

  test "should destroy prodorcarealizado" do
    assert_difference('Prodorcarealizado.count', -1) do
      delete :destroy, id: @prodorcarealizado
    end

    assert_redirected_to prodorcarealizados_path
  end
end
