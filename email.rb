require 'sinatra'
require 'pony'

get '/contact/?' do
  @title = 'Contact'
  erb :contact
end

post '/contact/?' do
  options = {
  :to => 'xxxxx@gmail.com',
  :from => params[:email],
  :subject => params[:name] + "has contacted you about a consulatation",
  :body => params[:message],
  :via => :smtp,
  :via_options => {
    :address => 'smtp.gmail.com',
    :port => '587',
    :domain => 'localhost.localdomain',
    :user_name => ENV['xxxxxx@gmail.com'],
    :password => ENV['xxxxxx'],
    :authentication => :plain,
    :enable_starttls_auto => true
    }
  }

  Pony.mail(options)

  redirect '/contact'
end
