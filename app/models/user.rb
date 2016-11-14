class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }

  validates :username, 
    uniqueness: { case_sensitive: false },
    presence: false

  ## 1 or more words, then space, then number between 1, 99999
  validates :address, 
    presence: false,
    format: { with: /[A-Za-z\s]+\s+\d{1,5}\Z/,
      message: "Venligst tilføj rigtig addresse fx: 'Min addresse 12'" }
end
