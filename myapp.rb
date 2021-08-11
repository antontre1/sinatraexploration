require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' #pour recharger automatiquement les pages lors du rafraississement sans avoir à relancer le server

# configure :development do
#     set :database, 'sqlite3:db/dogs.db'
#   end

set :database, {adapter: "sqlite3", database: "myapp.sqlite3"}
#set :database, "sqlite3:project-name.sqlite3"
#set :database, "sqlite3:development.sqlite3"

require './models'

# or set :database_file, "path/to/database.yml"
# configure :production do #permet 'en théorie' d'utiliser sinatra/reloader en production
# enable :reloader
# end

get '/' do
    @users = User.all
    erb :index
end

get '/foo', :agent => /Songbird\d/ do
    "You're using Songbird version #{params['agent'][0]}"
end

get '/foo' do
    # Matches non-songbird browsers
end