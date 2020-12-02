require_relative '../../config/environment'

class App < Sinatra::Base
    configure do
        enable :sessions
        set :session_secret, 'mysupersecretpassword'
        set :public, 'public'
        set :views, 'app/views'
        set :method_override, true
    end

    # Main Landing Page, Login Page
    get '/' do
        if session[:loggedin]
            redirect '/dashboard'
        else
            @error = ""
            erb :login
        end
    end

    # Redirect to Appropriate Path
    get '/login' do
        if session[:loggedin]
            redirect '/dashboard'
        else
            redirect '/'
        end
    end

    # Login Handler, Form Validation
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

    # Dashboard Page, Accessible only after successful login
    get '/dashboard' do
        if session[:loggedin]
            @spells = Spell.all
            erb :'dashboard/index'
        else
            redirect '/'
        end
    end

    # Signup Form
    get '/signup' do
        @error = ""
        if session[:loggedin]
            redirect '/dashboard'
        else
            erb :signup
        end
    end

    # Signup Form Validation
    post '/' do
        user = Wizard.all.find{ |user| user.username == params[:username] }

        if params[:password] != params[:confirm]
            @error = "Password does not match confirmed password"
            erb :signup
        elsif params.values.include?("")
            @error = "All fields are required!"
            erb :signup
        elsif user
            @error = "#{ params[:username] } already exists!"
            erb :signup
        else
            w = Wizard.new
            w.fname = params[:fname]
            w.lname = params[:lname]
            w.username = params[:username]
            w.password = params[:password]
            w.save

            @error = "Congratulations, #{ params[:fname] } - You're a wizard!"
            erb :login
        end
    end

    # Logout
    get '/logout' do
        session.clear
        redirect '/'
    end
end