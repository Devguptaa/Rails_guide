class UserMailer < ApplicationMailer
  # default from: 'nitin.gaurav@reddoorz.com'
  layout 'mailer'

  def welcome_email
    # @user = params[:user]
    # @url  = 'http://example.com/login'
    attachments["attachment.jpeg"] = File.read("/home/devgupta/Downloads/images.jpeg")
    mail(from: "nitin.gaurav@reddoorz.com",to:"dev.gupta@reddoorz.com",cc:"krapi.rastogi@reddorz.com", subject: 'Welcome to My Awesome Site')
  end
end
