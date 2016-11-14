require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
   test "email token" do
     @email = "rubyte@protonmail.ch"
     mail_sent = UserMailer.email_token(@email).deliver_now
     assert_not ActionMailer::Base.deliveries.empty?

     assert_equal ["rt@imusic.dk"], mail_sent.from
     assert_equal [@email],               mail_sent.to
     assert_equal "Flyover login link",   mail_sent.subject
   end
end
