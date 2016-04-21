require 'test_helper'

class DocArtefactsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:doc_artefacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create doc_artefact" do
    assert_difference('DocArtefact.count') do
      post :create, :doc_artefact => { }
    end

    assert_redirected_to doc_artefact_path(assigns(:doc_artefact))
  end

  test "should show doc_artefact" do
    get :show, :id => doc_artefacts(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => doc_artefacts(:one).id
    assert_response :success
  end

  test "should update doc_artefact" do
    put :update, :id => doc_artefacts(:one).id, :doc_artefact => { }
    assert_redirected_to doc_artefact_path(assigns(:doc_artefact))
  end

  test "should destroy doc_artefact" do
    assert_difference('DocArtefact.count', -1) do
      delete :destroy, :id => doc_artefacts(:one).id
    end

    assert_redirected_to doc_artefacts_path
  end
end
