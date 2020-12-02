class SpellController < App
    get '/dashboard/spells' do
        if session[:loggedin]
            @spells = Spell.all
            erb :'dashboard/spells/index'
        else
            redirect '/'
        end
    end

    get '/dashboard/spells/new' do
        if session[:loggedin]
            erb :'dashboard/spells/new'
        else
            redirect '/'
        end
    end
    
    get '/dashboard/spells/:id' do
        if session[:loggedin]
            @spells = Spell.all
            @spell = Spell.find(params[:id])
            erb :'dashboard/spells/show'
        else
            redirect '/'
        end
    end

    post '/dashboard/spells' do
        spell = Spell.new(params)
        spell.save

        redirect "/dashboard/spells/#{ spell.id }"
    end

    get '/dashboard/spells/:id/edit' do
        if session[:loggedin]
            @spell = Spell.find(params[:id])
            erb :'dashboard/spells/edit'
        else
            redirect '/'
        end
    end

    patch '/dashboard/spells/:id' do
        spell = Spell.find(params[:id])
        spell.update(params[:spell])

        redirect "/dashboard/spells/#{ spell.id }"
    end

    delete '/dashboard/spells/:id' do
        @spell = Spell.find(params[:id])
    end
end