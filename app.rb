require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/property'

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  register Sinatra::Flash

  get '/' do
    'Makers BnB'
  end

  get '/properties' do
    @properties = Property.all
    erb:'properties/index'
  end

  get '/properties/new' do
    erb:"/properties/new"
  end

  post '/properties' do
    Property.create(name: params[:name])
    redirect '/properties'
  end

  run! if app_file == $0
end
