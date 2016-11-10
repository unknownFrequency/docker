require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new
  end

  test "email should be required" do
    @user.valid?
    assert_includes(@user.errors[:email], "can't be blank" )
  end

  test "email should be present" do 
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be unique" do 
    @user.email = "abc@abc.dk"
    @user.save
    @user2 = User.new(email: "abc@abc.dk")
    assert_not @user2.valid?
  end

  #test "email should have a valid format" do
    #@users = [
      #[@user3 = User.new(email: "aa.dk")],
      #[@user4 = User.new(email: ".dk")],
      #[@user5 = User.new(email: "aa@dk")],
      #[@user6 = User.new(email: ".aadk")],
      #[@user7 = User.new(email: "abc.aadk")],
    #]

    #@users.each do |user_arr|
      #user_arr.each do |user|
        #assert_not user.valid?
      #end
    #end
  #end

end
