class HomeController < ApplicationController
  #before_action :authenticate_request!

  def index
    render component: 'EmailForm'
  end
end
