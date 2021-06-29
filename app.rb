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
  
  run! if app_file == $0
end