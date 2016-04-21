require 'test_helper'

class PapersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:papers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create papers" do
    assert_difference('Papers.count') do
      post :create, :papers => { }
    end

    assert_redirected_to papers_path(assigns(:papers))
  end

  test "should show papers" do
    get :show, :id => papers(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => papers(:one).id
    assert_response :success
  end

  test "should update papers" do
    put :update, :id => papers(:one).id, :papers => { }
    assert_redirected_to papers_path(assigns(:papers))
  end

  test "should destroy papers" do
    assert_difference('Papers.count', -1) do
      delete :destroy, :id => papers(:one).id
    end

    assert_redirected_to papers_path
  end
end
