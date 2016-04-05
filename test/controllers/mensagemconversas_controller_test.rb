require 'test_helper'

class MensagemconversasControllerTest < ActionController::TestCase
  setup do
    @mensagemconversa = mensagemconversas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mensagemconversas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mensagemconversa" do
    assert_difference('Mensagemconversa.count') do
      post :create, mensagemconversa: { conversa_id: @mensagemconversa.conversa_id, flag_lida: @mensagemconversa.flag_lida, mensgem: @mensagemconversa.mensgem, user_id: @mensagemconversa.user_id }
    end

    assert_redirected_to mensagemconversa_path(assigns(:mensagemconversa))
  end

  test "should show mensagemconversa" do
    get :show, id: @mensagemconversa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mensagemconversa
    assert_response :success
  end

  test "should update mensagemconversa" do
    patch :update, id: @mensagemconversa, mensagemconversa: { conversa_id: @mensagemconversa.conversa_id, flag_lida: @mensagemconversa.flag_lida, mensgem: @mensagemconversa.mensgem, user_id: @mensagemconversa.user_id }
    assert_redirected_to mensagemconversa_path(assigns(:mensagemconversa))
  end

  test "should destroy mensagemconversa" do
    assert_difference('Mensagemconversa.count', -1) do
      delete :destroy, id: @mensagemconversa
    end

    assert_redirected_to mensagemconversas_path
  end
end
