require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "create a new voter" do
    post :create
    assert_response :success
  end

  test "show if access token authenticated" do
    get :show, id: 1
    request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(id: 1).token}}
  end

  test "update if access token authenticated" do
    patch :update, id: 1
    request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(id: 1).token}}
  end

end
#request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(:test_one).token}}`
