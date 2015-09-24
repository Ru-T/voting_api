require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "create a new voter" do
    post :create, name: "Sara", party: "Democrat"
    assert_response :success
  end

  test "show if access token authenticated" do
    get :show, access_token: "018e3c41eb5440e2c7c961b522513d84"
    assert_response :success

    assert response_body.include?("Ruti")
  end

  test "update if access token authenticated" do
    voter = Voter.first
    patch :update, name: "Ania", party: "Independent", access_token: voter.access_token

    assert_equal "Ania", voter.reload.name
    assert_equal "Independent", voter.reload.party
  end

end
