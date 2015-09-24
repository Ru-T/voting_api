require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "show individual candidate" do
    get :show, id: 1

    assert_response :success
    assert respond.body.include("Trump")
  end
  #request.headers["HTTP_AUTHORIZATION"] = %{Token #{voters(:test_one).token}}`

end
