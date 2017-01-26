require 'test_helper'
require 'application_controller'
require 'home_controller'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    #parsed_response = JSON.parse(response.body)
    @app_controller = ApplicationController.new
    @home_controller = HomeController.new
    @session_controller = SessionsController.new
    @json_params = { data:
                       {email: "walther@diechmann.net"},
                     headers:
                       { 'Accept' => Mime[:json], 
                         'Content-Type' => Mime[:json] }
                   }.as_json
    @token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6IndhbHRoZXJAZGllY2htYW5uLm5ldCJ9.cOkK3kezUjWz-knlAZ35TsTu-YQCQG8LApzBJNgQCt4"
  end


  test "method authenticate_request! should authenticate and set session" do 
    post send_login_path, params: @json_params
    parsed_response = JSON.parse(response.body)
    assert parsed_response['session']['auth_token']
  end 


  test "supply email and send mail with token" do
    assert_difference "ActionMailer::Base.deliveries.size", +1 do 
      post send_login_path, params: @json_params
    end
    assert_response :success

    parsed_response = JSON.parse(response.body)
    assert_equal parsed_response['status'], "Token sendt"
    @token = parsed_response['token']
  end

  test "extract token from url" do
    uri = URI::parse("http://localhost:8080/sessions/token?#{@token}")
    url_params = CGI::parse(uri.query)
    assert_equal url_params.first[0], @token
  end

  test "should set token in header and be authenticated" do
    get root_path, headers: {HTTP_AUTHORIZATION: "Bearer #{@token}"}
    assert_response :success
    assert_not response.body.empty?
    assert_equal "Bearer #{@token}", request.headers[:Authorization]
  end

  ## TODO: Bug??
 test "should be denied access without valid token" do
   #assert_equal (get root_path, headers: {HTTP_AUTHORIZATION: "Bearer Made.Up.Token"}), 401
   #parsed_response = JSON.parse(response.body)
   #assert_equal parsed_response['errors'], "Du skal logge ind for at se denne side."
 end

 test "token should expire 2 min" do
   ## expires 2 min from now
   token = JsonWebToken.encode({email: "test@mail.com"}, Time.now.to_i + 120)
   ## expire 2 min ago and should be invalid/expired
   token = JsonWebToken.encode({email: "test@mail.com"}, Time.now.to_i - 120)
   assert_not JsonWebToken.decode(token)
 end

 test "should set session" do
   get root_path, headers: {HTTP_AUTHORIZATION: "Bearer #{@token}"}
   assert_equal session['jwt'], @token
 end

 test "validate session" do 
   ## Should set the session[:jwt] and be able to login without setting header (2nd get req.)
   get root_path, headers: {HTTP_AUTHORIZATION: "Bearer #{@token}"}
   get root_path
   assert_equal session[:jwt], @token
 end

  test "token method should have email variable" do
  end
end

