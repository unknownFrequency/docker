class HomeController < ApplicationController
  before_action :authenticate_request!
  def index
    respond_to do |format|
      format.html { flash[:notice] = "Velkommen fra dit nye hjem" }
      format.json { render json:  "Du er nu logget ind" }
    end
  end
end
