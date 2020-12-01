class SpellController < App
    get '/dashboard/spells' do
        erb :'dashboard/spells/index'
    end

    get '/dashboard/spells/new' do
        erb :'dashboard/spells/new'
    end
    
    get '/dashboard/spells/:id' do
        erb :'dashboard/spells/show'
    end

    post '/dashboard/spells' do

    end

    get '/dashboard/spells/:id/edit' do
        erb :'dashboard/spells/edit'
    end

    patch '/dashboard/spells/:id' do

    end

    delete '/dashboard/spells/:id' do

    end
end