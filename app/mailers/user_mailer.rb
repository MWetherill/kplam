class UserMailer < ApplicationMailer
  default from: 'matthew@kpstudio.co.uk'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Welcome to KPLAM')
  end

end
