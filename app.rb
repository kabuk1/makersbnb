require "sinatra/base"
require "sinatra/reloader"
require "sinatra/flash"
require "./lib/user"
require_relative "database_connection_setup"

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end
  register Sinatra::Flash
  attr_reader :user

  get "/" do
    erb :'users/new'
  end

  post "/users" do
    @user = User.create(email: params["email"], password: params["password"])
    session[:user_id] = @user.id
    erb :confirm
  end

  post "/sessions" do
    @user = User.authenticate(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      erb :confirm
    else
      flash[:notice] = "Please check your email or password."
      redirect("/login")
    end
  end
  get "/login" do
    erb :login
  end

  post "/login" do
    erb :login
  end

  run! if app_file == $0
end
