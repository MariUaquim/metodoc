require 'test_helper'

class MethodologiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:methodologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create methodology" do
    assert_difference('Methodology.count') do
      post :create, :methodology => { }
    end

    assert_redirected_to methodology_path(assigns(:methodology))
  end

  test "should show methodology" do
    get :show, :id => methodologies(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => methodologies(:one).id
    assert_response :success
  end

  test "should update methodology" do
    put :update, :id => methodologies(:one).id, :methodology => { }
    assert_redirected_to methodology_path(assigns(:methodology))
  end

  test "should destroy methodology" do
    assert_difference('Methodology.count', -1) do
      delete :destroy, :id => methodologies(:one).id
    end

    assert_redirected_to methodologies_path
  end
end
