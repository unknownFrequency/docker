##
## This is like the Controller
##
class UserMailer < ApplicationMailer

  def email_token(email)
    @url  = "http://localhost:8080/user/TESTURL"
      mail(
        to: email, 
        subject: "Flyover login link"
      )
  end 
end
