class HomeController < ApplicationController
  before_filter :authenticate_request!

  def index
    respond_to do |format|
      format.json { render json: {logged_in: true, 
                                  auth_header: request.headers['Authorization']} }
    end
  end
end
