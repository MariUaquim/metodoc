require 'test_helper'

class ParamsConfigsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:params_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create params_config" do
    assert_difference('ParamsConfig.count') do
      post :create, :params_config => { }
    end

    assert_redirected_to params_config_path(assigns(:params_config))
  end

  test "should show params_config" do
    get :show, :id => params_configs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => params_configs(:one).id
    assert_response :success
  end

  test "should update params_config" do
    put :update, :id => params_configs(:one).id, :params_config => { }
    assert_redirected_to params_config_path(assigns(:params_config))
  end

  test "should destroy params_config" do
    assert_difference('ParamsConfig.count', -1) do
      delete :destroy, :id => params_configs(:one).id
    end

    assert_redirected_to params_configs_path
  end
end
