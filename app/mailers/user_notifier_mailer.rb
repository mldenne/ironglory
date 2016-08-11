class UserNotifierMailer < ApplicationMailer
  default :from => 'ironglory@ironglory.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    @url = 'https://arcane-harbor-93523.herokuapp.com/login'
    mail( to: @user.email,
      subject: 'Thank you for signing up with Iron Glory' )
  end
end
