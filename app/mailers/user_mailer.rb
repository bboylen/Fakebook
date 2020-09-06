class UserMailer < ApplicationMailer
 
  def welcome_email(user)
    @user = user
    #@url  = 'http://example.com/login' #CHANGE
    mail(to: user.email, subject: 'Welcome to Fakebook')
  end
end
