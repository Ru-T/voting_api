require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "create a new vote" do
    post :create
    assert_response :success
  end

  test "destroy an existing vote" do
    delete :destroy, id: 1
    assert_response :success
  end

end
