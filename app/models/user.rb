class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true ## { case_sensitive: false }

  validates :username, presence: false, uniqueness: true

  ## 1 or more words, then space, then number between 1, 99999
  validates :address, presence: false, format: { with: /[A-Za-z\s]+\s+\d{1,5}\Z/, message: "Venligst tilføj rigtig addresse fx: 'Min addresse 12'" }
end
