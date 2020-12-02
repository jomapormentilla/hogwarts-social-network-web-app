class WizardController < App
    get '/dashboard/wizards' do
        if session[:loggedin]
            @wizards = Wizard.all
            erb :'dashboard/wizards/index'
        else
            redirect '/'
        end
    end

    get '/dashboard/wizards/new' do
        if session[:loggedin]
            erb :'dashboard/wizards/new'
        else
            redirect '/'
        end
    end
    
    get '/dashboard/wizards/:id' do
        if session[:loggedin]
            @wizard = Wizard.find(params[:id])
            erb :'dashboard/wizards/show'
        else
            redirect '/'
        end
    end

    post '/dashboard/wizards' do

    end

    get '/dashboard/wizards/:id/edit' do
        if session[:loggedin]
            @wizard = Wizard.find(params[:id])
            erb :'dashboard/wizards/edit'
        else
            redirect '/'
        end
    end

    put '/dashboard/wizards/:id' do
        @wizard = Wizard.find(params[:id])
        @wizard.fname = params[:fname]
        @wizard.lname = params[:lname]
        @wizard.save

        redirect "/dashboard/wizards/#{ params[:id] }"
    end

    delete '/dashboard/wizards/:id' do
        @wizard = Wizard.find(params[:id])
    end
end