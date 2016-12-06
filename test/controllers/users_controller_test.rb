require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    @params = { user: {
      email:     "testfgd@dfggh.dk",
      address:   "valid add 1",
      username:  "uniqName#{rand}",
      firstname: "Ruben",
      lastname:  "Thuesen",
      zip: 7741
    } }

    @user = FactoryGirl.build(:user)
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
  #test "JSON request can create user" do
    #url          = 'http://localhost:8080/users'
    #uri          = URI::parse(url)
    #http         = Net::HTTP.new(uri.host, uri.port)

    #request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    #request.body = @params.to_json
    #response     = http.request(request) 
    ##response = JSON.parse(response.body)
    #puts response.inspect
    #debugger
  #end
end
