class HouseController < App
    get '/dashboard/houses' do
        erb :'dashboard/houses/index'
    end

    get '/dashboard/houses/new' do
        erb :'dashboard/houses/new'
    end
    
    get '/dashboard/houses/:id' do
        erb :'dashboard/houses/show'
    end

    post '/dashboard/houses' do

    end

    get '/dashboard/houses/:id/edit' do
        erb :'dashboard/houses/edit'
    end

    patch '/dashboard/houses/:id' do

    end

    delete '/dashboard/houses/:id' do

    end
end