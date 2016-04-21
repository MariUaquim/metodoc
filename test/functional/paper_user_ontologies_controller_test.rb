require 'test_helper'

class PaperUserOntologiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paper_user_ontologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paper_user_ontology" do
    assert_difference('PaperUserOntology.count') do
      post :create, :paper_user_ontology => { }
    end

    assert_redirected_to paper_user_ontology_path(assigns(:paper_user_ontology))
  end

  test "should show paper_user_ontology" do
    get :show, :id => paper_user_ontologies(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => paper_user_ontologies(:one).id
    assert_response :success
  end

  test "should update paper_user_ontology" do
    put :update, :id => paper_user_ontologies(:one).id, :paper_user_ontology => { }
    assert_redirected_to paper_user_ontology_path(assigns(:paper_user_ontology))
  end

  test "should destroy paper_user_ontology" do
    assert_difference('PaperUserOntology.count', -1) do
      delete :destroy, :id => paper_user_ontologies(:one).id
    end

    assert_redirected_to paper_user_ontologies_path
  end
end
