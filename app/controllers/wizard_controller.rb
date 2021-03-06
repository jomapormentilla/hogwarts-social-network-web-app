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
            @wizards = Wizard.all
            @wizard = Wizard.find(params[:id])
            
            prev_wiz = @wizards.find_index(@wizard) - 1
            @prev = @wizards[prev_wiz]

            next_wiz = @wizards.find_index(@wizard) + 1
            @next = @wizards[next_wiz]
            
            erb :'dashboard/wizards/show'
        else
            redirect '/'
        end
    end

    post '/dashboard/wizards' do

    end

    get '/dashboard/wizards/:id/edit' do
        if session[:loggedin]
            @houses = House.all
            @wizard = Wizard.find(params[:id])
            erb :'dashboard/wizards/edit'
        else
            redirect '/'
        end
    end

    put '/dashboard/wizards/:id' do
        @wizard = Wizard.find(params[:id])
        @wizard.update(params[:wizard])

        redirect "/dashboard/wizards/#{ params[:id] }"
    end

    delete '/dashboard/wizards/:id' do
        @wizard = Wizard.find(params[:id])
    end
end