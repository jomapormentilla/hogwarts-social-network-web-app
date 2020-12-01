class WizardController < App
    get '/dashboard/wizards' do
        erb :'dashboard/wizards/index'
    end

    get '/dashboard/wizards/new' do
        erb :'dashboard/wizards/new'
    end
    
    get '/dashboard/wizards/:id' do
        erb :'dashboard/wizards/show'
    end

    post '/dashboard/wizards' do

    end

    get '/dashboard/wizards/:id/edit' do
        erb :'dashboard/wizards/edit'
    end

    patch '/dashboard/wizards/:id' do

    end

    delete '/dashboard/wizards/:id' do

    end
end