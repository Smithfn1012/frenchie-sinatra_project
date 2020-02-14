class DogsController < ApplicationController
    get '/dogs' do
      if is_logged_in?
        @dogs = current_user.dogs
        erb :'/dogs/index'
      else
        redirect '/login'
      end
    end

    get '/'


end