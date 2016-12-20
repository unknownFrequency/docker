require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @params = { user: {
      id:        2,
      email:     "testfgd@dfggh.dk",
      address:   "valid add 1",
      username:  "uniqName#{rand}",
      firstname: "Ruben",
      lastname:  "Thuesen",
      zip: 7741
    } }

    @user = FactoryGirl.build(:user)
  end

  test "should update existing user" do
    @user.update(@params[:user])
    assert_equal @user.firstname, @params[:user][:firstname]

    patch user_url(@user.id), params: { firstname: "changed" }
    @user.save
    assert_equal @user.firstname, "changed"
  end

  test "FactoryGirl user should be created and be valid" do
    assert @user.valid?
  end

  test "FactoryGirl user should be edited and be invalid" do
    user = @user.clone
    @user.save
    assert @user.valid?
    user.save
    assert_not user.valid?
  end

  test "Should create user with json formatted params" do
    user = User.create!(@params[:user])
    assert user.valid?
  end

  test "should have valid token and email from token" do
    #post users_url, params: @params
    #puts session.inspect
    #assert session['jwt']['auth_token']
  end

end
