require 'rubygems'
require 'sinatra'
require 'haml'
require 'pony'

    get '/' do
        haml :index
    end

    get '/contact' do
        haml :contact
    end

    post '/contact' do
        name = params[:name]
        mail = params[:mail]
        number=parmas[:number]
        body = params[:body]

        Pony.mail(:to => 'lausmooth@gmail.com', :from => "#{mail}", :subject => "consultation inquiry from #{name}", :body => "#{body}")

        haml :contact
        redirect '/success'
    end


    get('/success') do
    @notification = "Thanks for your email. I'll be in touch soon."
    end
