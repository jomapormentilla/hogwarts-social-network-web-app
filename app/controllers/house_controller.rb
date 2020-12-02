class HouseController < App
    get '/dashboard/houses' do
        if session[:loggedin]
            @houses = House.all
            erb :'dashboard/houses/index'
        else
            redirect '/'
        end
    end

    get '/dashboard/houses/new' do
        if session[:loggedin]
            erb :'dashboard/houses/new'
        else
            redirect '/'
        end
    end
    
    get '/dashboard/houses/:id' do
        if session[:loggedin]
            @houses = House.all
            @house = House.find(params[:id])

            prev_house = @houses.find_index(@house) - 1
            @prev = @houses[prev_house]
            
            next_house = @houses.find_index(@house) + 1
            @next = @houses[next_house]

            erb :'dashboard/houses/show'
        else
            redirect '/'
        end
    end

    post '/dashboard/houses' do

    end

    get '/dashboard/houses/:id/edit' do
        if session[:loggedin]
            @house = House.find(params[:id])
            erb :'dashboard/houses/edit'
        else
            redirect '/'
        end
    end

    patch '/dashboard/houses/:id' do
        house = House.find(params[:id])
        house.update(params[:house])

        redirect "/dashboard/houses/#{ house.id }"
    end

    delete '/dashboard/houses/:id' do
        @house = House.find(params[:id])
    end
end