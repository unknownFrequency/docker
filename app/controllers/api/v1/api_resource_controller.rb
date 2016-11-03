class Api::V1::ApiResourceController < JSONAPI::ResourceController
  def context
    { api_user: @user }
  end
end
