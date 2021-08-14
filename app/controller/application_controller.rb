class ApplicationController < Sinatra::Base
    configure do
        set :views, 'app/views'
    end
    get '/' do
        @users = User.all
        erb :index
    end
    
    get '/foo', :agent => /\d/ do
        "paramètre #{params['agent'][0]}"
    end
    
    get '/foo' do
        # Matches non-songbird browsers
    end