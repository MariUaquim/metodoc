require 'test_helper'

class DocTypeConfigsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doc_type_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doc_type_config" do
    assert_difference('DocTypeConfig.count') do
      post :create, :doc_type_config => { }
    end

    assert_redirected_to doc_type_config_path(assigns(:doc_type_config))
  end

  test "should show doc_type_config" do
    get :show, :id => doc_type_configs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => doc_type_configs(:one).id
    assert_response :success
  end

  test "should update doc_type_config" do
    put :update, :id => doc_type_configs(:one).id, :doc_type_config => { }
    assert_redirected_to doc_type_config_path(assigns(:doc_type_config))
  end

  test "should destroy doc_type_config" do
    assert_difference('DocTypeConfig.count', -1) do
      delete :destroy, :id => doc_type_configs(:one).id
    end

    assert_redirected_to doc_type_configs_path
  end
end
