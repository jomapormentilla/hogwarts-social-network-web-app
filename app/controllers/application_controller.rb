require_relative '../../config/environment'

class App < Sinatra::Base
    configure do
        enable :sessions
        set :session_secret, "mysupersecretpassword"
    end
    
    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :index
    end
end