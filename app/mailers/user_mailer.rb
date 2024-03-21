class UserMailer < ApplicationMailer
  # default from: 'nitin.gaurav@reddoorz.com'
  layout 'mailer'

  def welcome_email(user)
    # @user = params[:user]
    # @url  = 'http://example.com/login'
    @user=user
    attachments["attachment.jpeg"] = File.read("/home/devgupta/Downloads/images.jpeg")
    mail(from: "nitin.gaurav@reddoorz.com",to: @user.email,cc:["nitin.gaurav@reddoorz.com","devgupta5552@gmail.com"], subject: 'Welcome to My Awesome Site',body: @user.name + "We are happy")
  end
end
