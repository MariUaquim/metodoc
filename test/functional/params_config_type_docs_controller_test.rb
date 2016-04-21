require 'test_helper'

class ParamsConfigTypeDocsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:params_config_type_docs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create params_config_type_doc" do
    assert_difference('ParamsConfigTypeDoc.count') do
      post :create, :params_config_type_doc => { }
    end

    assert_redirected_to params_config_type_doc_path(assigns(:params_config_type_doc))
  end

  test "should show params_config_type_doc" do
    get :show, :id => params_config_type_docs(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => params_config_type_docs(:one).id
    assert_response :success
  end

  test "should update params_config_type_doc" do
    put :update, :id => params_config_type_docs(:one).id, :params_config_type_doc => { }
    assert_redirected_to params_config_type_doc_path(assigns(:params_config_type_doc))
  end

  test "should destroy params_config_type_doc" do
    assert_difference('ParamsConfigTypeDoc.count', -1) do
      delete :destroy, :id => params_config_type_docs(:one).id
    end

    assert_redirected_to params_config_type_docs_path
  end
end
