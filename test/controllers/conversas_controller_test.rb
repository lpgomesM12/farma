require 'test_helper'

class ConversasControllerTest < ActionController::TestCase
  setup do
    @conversa = conversas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conversas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conversa" do
    assert_difference('Conversa.count') do
      post :create, conversa: { orcamentoempresa_id: @conversa.orcamentoempresa_id, user_id: @conversa.user_id }
    end

    assert_redirected_to conversa_path(assigns(:conversa))
  end

  test "should show conversa" do
    get :show, id: @conversa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conversa
    assert_response :success
  end

  test "should update conversa" do
    patch :update, id: @conversa, conversa: { orcamentoempresa_id: @conversa.orcamentoempresa_id, user_id: @conversa.user_id }
    assert_redirected_to conversa_path(assigns(:conversa))
  end

  test "should destroy conversa" do
    assert_difference('Conversa.count', -1) do
      delete :destroy, id: @conversa
    end

    assert_redirected_to conversas_path
  end
end
