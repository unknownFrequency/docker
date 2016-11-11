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

  test "username should be unique" do
    user3 = create(:user, username: "Ruben", email: "a@a.a")
    assert user3.valid?
    user4 = User.new(username: "Ruben", email: "b@b.b")
    assert_not user4.valid?
  end
end
