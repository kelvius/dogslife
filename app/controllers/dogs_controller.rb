# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  def index
    @dogs = if params[:breed].present?
              Dog.search_by_breed(params[:breed]).page(params[:page])
            else
              Dog.all.page(params[:page])
            end
  end



  def show
    @dog = Dog.find(params[:id])
  end
end
