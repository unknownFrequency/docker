class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true

  validates :username, uniqueness: true
end
