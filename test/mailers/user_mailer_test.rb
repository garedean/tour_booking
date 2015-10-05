require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "activation_email" do
    mail = UserMailer.activation_email
    assert_equal "Activation email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
