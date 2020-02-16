class DogsController < ApplicationController
  
  get '/dogs' do
    if is_logged_in?
      @dogs = current_user.dogs

      erb :'/dogs/index'
    else
      redirect '/login'
    end
  end

  post '/dogs/' do
      post = current_user.dogs.build(params[:dog])
      if post.save
        redirect '/dogs'
      else
        erb :'/dogs/new'
      end
  end

  get '/dogs/new' do
    redirect_if_not_logged_in
    
    erb :'dogs/new'
  end

  get '/dogs/:id' do
    redirect_if_not_logged_in
    find_dog(params[:id])

    erb :'dogs/show'
  end

  get '/dogs/:id/edit' do
    redirect_if_not_logged_in
    find_dog(params[:id])
    authorize_user_to_dog(@dog)

    erb :'dogs/edit'
  end

  patch '/dogs/:id' do
    redirect_if_not_logged_in
    find_dog(params[:id])
    authorize_user_to_dog(@dog)

    if @dog.update(params[:dog])
      redirect "/dogs/#{@dog.id}"
    else
      erb :'/dogs/edit'
    end
  end

  delete '/dogs/:id' do
    redirect_if_not_logged_in
    find_dog(params[:id])
    authorize_user_to_dog(@dog)
    @dog.destroy
    redirect '/dogs'
  end

  def find_dog(id)
    @dog = Dog.find_by_id(params[:id])
  end

  def authorize_user_to_dog(dog)
    redirect '/' unless dog.user_id == current_user.id
  end
end

