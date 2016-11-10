require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new
  end

  test "Email should be required" do
    @user.valid?
    assert_includes(@user.errors[:email], "can't be blank")
  end

end
