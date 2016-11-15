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

  test "create JWT token" do
    @user = build(:user)
    params = { "user" => @user.as_json }
    #Faker cannot product uniq email???
    params['user']['email'] = rand(100).to_s + "@" + rand(100).to_s + ".dk"
    post users_url, params: params
    @parsed_response = JSON.parse(response.body)
    assert_equal @parsed_response['status'], "Token sendt"
  end

  test ""
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
