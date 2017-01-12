class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader

  validates :email, 
    presence: true

  validates :username, 
    presence: false, 
    uniqueness: true, 
    on: :update

  ### 1 or more words, then space, then number between 1,99999
  validates :address, 
    presence: false, 
    format: { with: /[A-Za-z\s]+\s+\d{1,5}\Z/, 
              message: "Venligst tilføj rigtig addresse fx: 'Min addresse 12'" },
    on: :update

end
