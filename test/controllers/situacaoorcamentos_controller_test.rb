require 'test_helper'

class SituacaoorcamentosControllerTest < ActionController::TestCase
  setup do
    @situacaoorcamento = situacaoorcamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:situacaoorcamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create situacaoorcamento" do
    assert_difference('Situacaoorcamento.count') do
      post :create, situacaoorcamento: { nome: @situacaoorcamento.nome }
    end

    assert_redirected_to situacaoorcamento_path(assigns(:situacaoorcamento))
  end

  test "should show situacaoorcamento" do
    get :show, id: @situacaoorcamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @situacaoorcamento
    assert_response :success
  end

  test "should update situacaoorcamento" do
    patch :update, id: @situacaoorcamento, situacaoorcamento: { nome: @situacaoorcamento.nome }
    assert_redirected_to situacaoorcamento_path(assigns(:situacaoorcamento))
  end

  test "should destroy situacaoorcamento" do
    assert_difference('Situacaoorcamento.count', -1) do
      delete :destroy, id: @situacaoorcamento
    end

    assert_redirected_to situacaoorcamentos_path
  end
end
