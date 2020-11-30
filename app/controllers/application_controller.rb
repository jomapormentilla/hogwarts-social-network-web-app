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

    get '/signup' do
        if session[:loggedin]
            redirect '/dashboard'
        else
            erb :signup
        end
    end

    post '/' do
        user = Wizard.all.find{ |user| user.username == params[:username] }

        if params[:password] != params[:confirm]
            @error = "Password does not match confirmed password"
        elsif params.values.include?("")
            @error = "All fields are required!"
        elsif user
            @error = "#{ params[:username] } already exists!"
        else
            w = Wizard.new
            w.fname = params[:fname]
            w.lname = params[:lname]
            w.username = params[:username]
            w.password = params[:password]
            w.save

            @error = "Congratulations, #{ params[:fname] } - You're a wizard!"
        end
        erb :login
    end

    get '/login' do
        if session[:loggedin]
            redirect '/dashboard'
        else
            redirect '/'
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