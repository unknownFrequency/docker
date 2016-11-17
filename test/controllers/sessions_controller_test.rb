require 'test_helper'
require 'application_controller'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    #parsed_response = JSON.parse(response.body)
    @app_controller = ApplicationController.new
    #@token = parsed_response['token']
  end

  test "supply email and send mail with token" do
    @json_params = { data:
                       {email: "walther@diechmann.net"},
                     headers:
                       {"Content-Type" => "application/json"} }.as_json
    
    assert_difference "ActionMailer::Base.deliveries.size", +1 do 
      post send_login_path, params: @json_params
    end
    assert_response :success

    @parsed_response = JSON.parse(response.body)
    assert_equal @parsed_response['status'], "Token sendt"
  end

  #test "following URL with token included should create session for user" do
    #uri = URI::parse("http://localhost:8080/token/token?#{@token}")
    #url_params = CGI::parse(uri.query)
    #assert_equal url_params.first[0], @token
    ### User is now authenticated
    #get users_path, params: {}, headers: { "AUTHORIZATION": "Bearer #{@token}"  }
    #@request.headers['Authorization'] = "Bearer #{@token}"
    #@app_controller.authenticate_request! 
    ##request.headers['Authorization'] = url_params.first[0]
    #puts "response = #{response.body}"
    #assert_response :success
    #assert_not response.body.empty?

  #end

  #test "should get new" do
    #get send_login
    #assert_response :success
  #end
end



    #url          = 'http://localhost:8080/users'
    #uri          = URI::parse(url)
    #http         = Net::HTTP.new(uri.host, uri.port)

    #request      = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    #request.body = @params.to_json
    #response     = http.request(request) 
    ##response = JSON.parse(response.body)
    #puts response.inspect
    #debugger
