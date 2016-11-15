require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "signup" do
    assert_difference "ActionMailer::Base.deliveries.size", +1 do 
      post users_url, params: { user: {email: "rubyte@protonmail.com", address: "Gl. Aalborgvej 16"} }
    end

    email = ActionMailer::Base.deliveries.last
    assert_equal ["rt@imusic.dk"],           email.from
    assert_equal ["rubyte@protonmail.com"],  email.to
    assert_equal "Flyover login link",       email.subject
  end

#{'ACCEPT' => "application/json", 'CONTENT_TYPE' => 'application/json'}
  test "signup with all attributes" do
    params = { user: build(:user).as_json }
    assert_equal (post users_url, params: params), 200
  end

  setup do
    #@user = build(:user)
    
    params = { "user": {email: "testfgd@dfggh.dk", address: "valid add 1", username: "uniqName"} }
    post users_url, params: params
    @parsed_response = JSON.parse(response.body)
    assert_equal @parsed_response['status'], "Token sendt"
  end

  test "A decoded token should return user_id equal to current users id" do
    decoded_token_id = ApplicationController::decode(@parsed_response['token'])
    assert_equal decoded_token_id['user_id'], @parsed_response['user_id']
  end
  #test "should get new" do
    #get users_new_url
    #assert_response :success
  #end

  #test "should get create" do
    #get users_create_url
    #assert_response :success
  #end

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
