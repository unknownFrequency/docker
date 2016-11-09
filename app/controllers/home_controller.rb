class HomeController < ApplicationController
  before_filter :authenticate_request!

  def index
    #respond_to do |format|
      #format.json { render json: {
                      #auth_token: @auth_token,
                      #http_token: @http_token
                  #}}
    #end
  end


    #respond_to do |format|
      #if not request.headers['Authorization'].nil?
        #format.json { render json: {
                        #logged_in: true,
                        #auth_header: request.headers['Authorization']
                    #}}
      #else
        #format.json { render json: {error: "Authentication Header ikke sat korrekt"} }
      #end
    #end
  #end

end
