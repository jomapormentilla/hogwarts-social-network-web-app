require_relative '../../config/environment'

class App < Sinatra::Base
    configure do
        enable :sessions
        set :session_secret, "mysupersecretpassword"
    end
    
    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        if session[:loggedin]
            redirect '/dashboard'
        else
            @error = ""
            erb :login
        end
    end

    post '/login' do
        if session[:loggedin]
            redirect '/dashboard'
        else
            validate = Wizard.all.find{ |user| user.username == params[:username] && user.password == params[:password] }

            if validate != nil
                session[:user] = validate
                session[:loggedin] = true
                @session = session

                redirect '/dashboard'
            else
                @error = "Invalid Username or Password"
                erb :login
            end
        end
    end

    get '/dashboard' do
        if session[:loggedin]
            @session = session
            @spells = Spell.all
            erb :index
        else
            redirect '/'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end
end