class Api::V1::CommentResource < Api::V1::ApplicationResource
  attributes :created_at, :body, :username
  has_one    :post
  filters    :id, :username
end
