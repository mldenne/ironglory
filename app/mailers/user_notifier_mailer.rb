class UserNotifierMailer < ApplicationMailer
  default :from => 'ironglory@ironglory.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up with Iron Glory' )
  end
end
