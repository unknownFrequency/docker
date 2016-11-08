class HomeController < ApplicationController
  before_filter :authenticate_request!

  def index

  end
end
