require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader 
  end

  register Sinatra::Flash
  
  run! if app_file == $0
end