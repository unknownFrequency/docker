require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    params = { "user": {email: "testfgd@dfggh.dk", address: "valid add 1", username: "uniqName"} }
    post users_url, params: params
    @parsed_response = JSON.parse(response.body)
    assert_equal @parsed_response['status'], "Token sendt"
  end

  test "token should expire 2 min" do
    ## expires 2 min from now
    token = ApplicationController::encode({ :id => 22 }, Time.now.to_i + 120)
    ## expire 2 min ago and should be invalid/expired
    token = ApplicationController::encode({ :id => 22 }, Time.now.to_i - 120)
    assert_not ApplicationController::decode(token)
  end


  test "submitting email form should send an email" do
    assert_difference "ActionMailer::Base.deliveries.size", +1 do 
      post users_url, params: { user: {email: "rubyte@protonmail.com", address: "Gl. Aalborgvej 16"} }
    end

    email = ActionMailer::Base.deliveries.last
    assert_equal ["rt@imusic.dk"],           email.from
    assert_equal ["rubyte@protonmail.com"],  email.to
    assert_equal "Flyover login link",       email.subject
  end

  test "signup with all attributes" do
    params = { user: build(:user).as_json }
    assert_equal (post users_url, params: params), 200
  end

  test "A decoded token should return user_id equal to current users id" do
    decoded_token_id = ApplicationController::decode(@parsed_response['token'])
    assert_equal decoded_token_id['user_id'], @parsed_response['user_id']
  end

  test "Using token to authenticate" do
    get '/users/1/token' , params: {token: "tokentokentoken"}
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  #test "should get index" do
    #get users_index_url
    #assert_response :success
  #end

  #test "should get update" do
    #get users_update_url
    #assert_response :success
  #end

  #test "should get delete" do
    #get users_delete_url
    #assert_response :success
  #end

end
