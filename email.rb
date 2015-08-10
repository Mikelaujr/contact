require 'sinatra'
require 'pony'

get '/contact/?' do
  @title = 'Contact'
  erb :contact
end

post '/contact/?' do
  options = {
  :to => 'michaelau_1@hotmail.com',
  :from => params[:email],
  :subject => params[:name] + " has contacted you about a consultation",
  :body => "hi my name is " + params[:name] + "," + "\n\n my phone number is " + params[:phone] + "\n\n my email is " + params[:email] + "," + "\n\n i want to talk about " + params[:message],
  :via => :smtp,
  :via_options => {
    :address => 'smtp.live.com',
    :port => '587',
    :domain => 'localhost.localdomain',
    :user_name => 'michaelau_1@hotmail.com',
    :password => '473503a',
    :authentication => :plain,
    :enable_starttls_auto => true
    }
  }

  Pony.mail(options)
  redirect '/contact'
end
