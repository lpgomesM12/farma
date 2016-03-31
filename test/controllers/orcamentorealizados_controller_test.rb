require 'test_helper'

class OrcamentorealizadosControllerTest < ActionController::TestCase
  setup do
    @orcamentorealizado = orcamentorealizados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orcamentorealizados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orcamentorealizado" do
    assert_difference('Orcamentorealizado.count') do
      post :create, orcamentorealizado: { mensagem: @orcamentorealizado.mensagem, orcamentoempresa_id: @orcamentorealizado.orcamentoempresa_id, porcentagemdesconto: @orcamentorealizado.porcentagemdesconto, situacaoorcamento_id: @orcamentorealizado.situacaoorcamento_id, valor_desconto: @orcamentorealizado.valor_desconto, valor_orcamento: @orcamentorealizado.valor_orcamento, valor_total: @orcamentorealizado.valor_total }
    end

    assert_redirected_to orcamentorealizado_path(assigns(:orcamentorealizado))
  end

  test "should show orcamentorealizado" do
    get :show, id: @orcamentorealizado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orcamentorealizado
    assert_response :success
  end

  test "should update orcamentorealizado" do
    patch :update, id: @orcamentorealizado, orcamentorealizado: { mensagem: @orcamentorealizado.mensagem, orcamentoempresa_id: @orcamentorealizado.orcamentoempresa_id, porcentagemdesconto: @orcamentorealizado.porcentagemdesconto, situacaoorcamento_id: @orcamentorealizado.situacaoorcamento_id, valor_desconto: @orcamentorealizado.valor_desconto, valor_orcamento: @orcamentorealizado.valor_orcamento, valor_total: @orcamentorealizado.valor_total }
    assert_redirected_to orcamentorealizado_path(assigns(:orcamentorealizado))
  end

  test "should destroy orcamentorealizado" do
    assert_difference('Orcamentorealizado.count', -1) do
      delete :destroy, id: @orcamentorealizado
    end

    assert_redirected_to orcamentorealizados_path
  end
end
