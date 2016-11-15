require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
   test "email token" do
     @email = "rubyte@protonmail.ch"
     token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2NX0.BPXCNcY8GR8FVJYjYEoVS9iJo15fWNmTWOjwtTvSKvU"
     mail_sent = UserMailer.email_token(@email, token).deliver_now
     assert_not ActionMailer::Base.deliveries.empty?

     assert_equal ["rt@imusic.dk"],       mail_sent.from
     assert_equal [@email],               mail_sent.to
     assert_equal "Flyover login link",   mail_sent.subject
   end
end
