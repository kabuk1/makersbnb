require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/user'
require_relative 'database_connection_setup'

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end
  attr_reader :user


  register Sinatra::Flash

  get '/' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = @user.id
    erb :confirm
  end

  post '/login' do
    erb :login
  end

  run! if app_file == $0
end
