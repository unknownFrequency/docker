class Api::V1::PostResource < Api::V1::ApplicationResource
  attributes :title, :body, :status
  has_many   :comments
  filters    :id, :title
  filter     :status, default: "tilføjet,venter"

  def self.records(optiona={})
    options[:context][:api_user].posts
  end
end
