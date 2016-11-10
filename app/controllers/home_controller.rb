class HomeController < ApplicationController
  before_filter :authenticate_request!

  def index
    respond_to do |format|
      format.json { render json: @user }
    end
  end

end
