class UserMailer < ApplicationMailer
 
  def welcome_email(user)
    @user = user
    @url  = 'https://lit-woodland-51918.herokuapp.com' #CHANGE
    mail(to: user.email, subject: 'Welcome to Fakebook')
  end
end
