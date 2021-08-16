require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader' #pour recharger automatiquement les pages lors du rafraississement sans avoir à relancer le server
require 'chartkick'

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

get '/chart' do
    @title = "Deployments per day"
    @data = {'2015-07-20 00:00:00 UTC' => 2, '2015-07-21 00:00:00 UTC' => 4, '2015-07-22 00:00:00 UTC' => 1, '2015-07-23 00:00:00 UTC' => 7}
    erb :chart
end


get '/foo', :agent => /Songbird\d/ do
    "You're using Songbird version #{params['agent'][0]}"
end

get '/foo' do
    # Matches non-songbird browsers
end