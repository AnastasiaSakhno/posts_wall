class UserMailer < ApplicationMailer
  def welcome_email args
    @email = args[:email]
    @password = args[:password]
    @full_name = args[:full_name]
    @url = args[:url]
    mail(to: @email, subject: 'Welcome to PostsWall')
  end
end
