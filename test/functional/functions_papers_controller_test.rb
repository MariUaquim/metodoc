require 'test_helper'

class FunctionsPapersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:functions_papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create functions_papers" do
    assert_difference('FunctionsPapers.count') do
      post :create, :functions_papers => { }
    end

    assert_redirected_to functions_papers_path(assigns(:functions_papers))
  end

  test "should show functions_papers" do
    get :show, :id => functions_papers(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => functions_papers(:one).id
    assert_response :success
  end

  test "should update functions_papers" do
    put :update, :id => functions_papers(:one).id, :functions_papers => { }
    assert_redirected_to functions_papers_path(assigns(:functions_papers))
  end

  test "should destroy functions_papers" do
    assert_difference('FunctionsPapers.count', -1) do
      delete :destroy, :id => functions_papers(:one).id
    end

    assert_redirected_to functions_papers_path
  end
end
