##
## This is like the Controller
##
class UserMailer < ApplicationMailer
default from: "support@flyover.dk"

  def email_token(email)
    @url  = "http://localhost:8080/user/token"
      mail(to: email, subject: "Flyover login link")
  end 
end
