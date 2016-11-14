require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "signup" do
    assert_difference "ActionMailer::Base.deliveries.size", +1 do 
      post users_url, params: { user: {email: "rubuyte@protonmail.com", address: "Gl. Aalborgvej 16"} }
    end

    email = ActionMailer::Base.deliveries.last
    puts email.inspect
    assert_equal ["support@flyover.dk"],     email.from
    assert_equal ["rubuyte@protonmail.com"], email.to
    assert_equal "Flyover login link",       email.subject

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
