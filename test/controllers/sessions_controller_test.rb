require 'test_helper'
require 'application_controller'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    #parsed_response = JSON.parse(response.body)
    @app_controller = ApplicationController.new
    @token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6IndhbHRoZXJAZGllY2htYW5uLm5ldCJ9.cOkK3kezUjWz-knlAZ35TsTu-YQCQG8LApzBJNgQCt4"
  end

  test "supply email and send mail with token" do
    json_params = { data:
                       {email: "walther@diechmann.net"},
                     headers:
                       { 'Accept' => Mime[:json], 
                         'Content-Type' => Mime[:json] }
                   }.as_json
    
    assert_difference "ActionMailer::Base.deliveries.size", +1 do 
      post send_login_path, params: json_params
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
    assert_not response.body.empty?
    parsed_response = JSON.parse(response.body)
    assert_equal parsed_response['message'], "Du er inde i varmen!"
    assert_equal 'application/json; charset=utf-8', response.headers['Content-Type']
  end

  test "should be denied access without valid token" do
    assert_equal (get root_path, headers: {HTTP_AUTHORIZATION: "Bearer Made.Up.Token"}), 401
    parsed_response = JSON.parse(response.body)
    assert_equal parsed_response['errors'], "Her skal du ikke være!"
  end
end

