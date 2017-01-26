class UserMailerPreview < ActionMailer::Preview

  def email_token
    UserMailer.email_token("rubyte@protonmail.com")
  end

end
