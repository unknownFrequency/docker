class HomeController < ApplicationController
  before_filter :authenticate_request!

  def index
    render json: { errors: ['Not Authenticated']  }
  end

  def show
    respond_with json: { message: ['home#show'] }
  end

end
