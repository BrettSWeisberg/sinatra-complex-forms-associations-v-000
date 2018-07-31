class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
  #  binding.pry
    if params[:owner_id].empty? == true
    @owner = Owner.create(name: params[:owner][:name])

    @pet = Pet.create(name: params[:pet][:name], owner_id: owner.id)

    redirect to "pets/#{@pet.id}"
    else

    @pet = Pet.create(name: params[:pet][:name], owner_id: params[:owner_id])
    
    redirect to "pets/#{@pet.id}"
    end
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])


    erb :'/pets/show'
  end

  post '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
