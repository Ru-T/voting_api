require 'test_helper'

class VotersControllerTest < ActionController::TestCase

  def test_create_a_new_voter
    post :create, name: "Sara", party: "Democrat"
    assert_response :success
  end

  def test_show_individual
    get :show, id: voters(:ruti).id, access_token: voters(:ruti).access_token
    assert_response :success

    assert response.body.include?("Ruti")
  end

  def test_show_requires_correct_token
    get :show, id: voters(:ruti).id, access_token: "faketoken"

    assert_response :success
    assert response.body.include?("Wrong")
  end

  def test_update_individual
    patch :update, id: voters(:ruti).id, access_token: voters(:ruti).access_token, name: "Marion"
    assert_response :success

    refute response.body.include?("Ruti")
    assert response.body.include?("Marion")
    assert response.body.include?(voters(:ruti).party)
  end

  def test_update_requires_correct_token
    patch :update, id: voters(:ruti).id, access_token: "faketoken"

    assert_response :success
    assert response.body.include?("Wrong")
  end

  def test_update_can_fail_to_save
    patch :update, id: voters(:ruti).id, access_token: voters(:ruti).access_token, name: "Ilan"

    assert_response :success
    assert response.body.include?("name")
  end

end
