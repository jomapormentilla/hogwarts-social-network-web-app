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
            user = Wizard.find_by( username: params[:username])

            if user && user.authenticate(params[:password])
                session[:user] = user
                session[:loggedin] = true

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
        user = Wizard.find_by( username: params[:username] )

        if params[:wizard][:password] != params[:confirm]
            @error = "Password does not match confirmed password"
            erb :signup
        elsif params[:wizard].values.include?("")
            @error = "All fields are required!"
            erb :signup
        elsif user
            @error = "#{ params[:wizard][:username] } already exists!"
            erb :signup
        else
            w = Wizard.new(params[:wizard])
            w.house = House.all.sample
            w.student_spells << Spell.all.sample
            w.save

            @error = "Congratulations, #{ params[:wizard][:fname] } - You're a wizard!"
            erb :login
        end
    end

    # Logout
    get '/logout' do
        session.clear
        redirect '/'
    end
end