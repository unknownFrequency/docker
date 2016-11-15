##
## This is like the Controller
##
class UserMailer < ApplicationMailer

  def email_token(email, token)
    @url  = "http://localhost:8080/user/?token=#{token}"
      mail(
        to: email, 
        subject: "Flyover login link"
      )
  end 
end
