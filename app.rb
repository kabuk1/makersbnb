require "sinatra/base"
require "sinatra/reloader"
require "sinatra/flash"
require "./lib/user"
require "./lib/property"
require_relative "database_connection_setup"

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  enable :sessions

  attr_reader :user, :properties

  get "/" do
    erb :'users/new'
  end

  get "/properties" do
    @properties = Property.all
    erb :'properties/index'
  end

  get "/properties/new" do
    erb :"/properties/new"
  end

  post "/properties" do
    Property.create(name: params[:name], description: params[:description], location: params[:location], price: params[:price], from_date: params[:from_date], to_date: params[:to_date])
    redirect "/properties"
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

  get "/logout" do
    session.clear
    flash[:notice] = "You have logged out"
    erb :"/users/new"
  end

  post '/booking' do
    redirect '/properties'
  end

  get '/request' do
    erb :'booking-form'
  end

  post '/requests' do
    session[:checkin] = params[:checkin]
    session[:checkout] = params[:checkout]
    session[:guests] = params[:guests]
    redirect '/properties'
  end
  run! if app_file == $0
end
