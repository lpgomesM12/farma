require 'test_helper'

class DadosusersControllerTest < ActionController::TestCase
  setup do
    @dadosuser = dadosusers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dadosusers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dadosuser" do
    assert_difference('Dadosuser.count') do
      post :create, dadosuser: { endereco_id: @dadosuser.endereco_id, user_id: @dadosuser.user_id }
    end

    assert_redirected_to dadosuser_path(assigns(:dadosuser))
  end

  test "should show dadosuser" do
    get :show, id: @dadosuser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dadosuser
    assert_response :success
  end

  test "should update dadosuser" do
    patch :update, id: @dadosuser, dadosuser: { endereco_id: @dadosuser.endereco_id, user_id: @dadosuser.user_id }
    assert_redirected_to dadosuser_path(assigns(:dadosuser))
  end

  test "should destroy dadosuser" do
    assert_difference('Dadosuser.count', -1) do
      delete :destroy, id: @dadosuser
    end

    assert_redirected_to dadosusers_path
  end
end
