require 'test_helper'

class TipoprodutosControllerTest < ActionController::TestCase
  setup do
    @tipoproduto = tipoprodutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipoprodutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipoproduto" do
    assert_difference('Tipoproduto.count') do
      post :create, tipoproduto: { nome: @tipoproduto.nome }
    end

    assert_redirected_to tipoproduto_path(assigns(:tipoproduto))
  end

  test "should show tipoproduto" do
    get :show, id: @tipoproduto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipoproduto
    assert_response :success
  end

  test "should update tipoproduto" do
    patch :update, id: @tipoproduto, tipoproduto: { nome: @tipoproduto.nome }
    assert_redirected_to tipoproduto_path(assigns(:tipoproduto))
  end

  test "should destroy tipoproduto" do
    assert_difference('Tipoproduto.count', -1) do
      delete :destroy, id: @tipoproduto
    end

    assert_redirected_to tipoprodutos_path
  end
end
