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

  test "set JWT token" do
    x = post users_url, params: { user: {id: 1, email: "rubyte@protonmail.com"} }
    puts x.inspect
    debugger
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
