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

