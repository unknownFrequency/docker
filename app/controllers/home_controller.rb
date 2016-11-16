class HomeController < ApplicationController
  before_action :authenticate_request!

  def index
    render json: { Message: "Du er nu logget ind"  }
  end
end
