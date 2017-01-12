##
## This is like the Controller
##
class TokenMailer < ApplicationMailer

  def email_token(email, token)
    ## !TODO in production --> Change to real URL
    @url  = "http://localhost:8080/sessions/?token=#{token}"
      mail(
        to: email, 
        subject: "Flyover login link"
      )
  end 
end
