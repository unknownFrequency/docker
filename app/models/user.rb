class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true

  validates :username, uniqueness: true
  ## ! or more words, then space, then number between 1, 99999
  validates :address, format: { with: /[A-Za-z\s]+\s+\d{1,5}\Z/,
    message: "Venligst tilføj rigtig addresse fx: 'Min addresse 12'" }
end
