# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  def index
    # @dogs = if params[:breed].present?
    #           Dog.search_by_breed(params[:breed]).page(params[:page])
    #         else
    #           Dog.all.page(params[:page])
    #         end
    @dogs = Dog.all
    @dogs = @dogs.search_by_breed(params[:breed]) if params[:breed].present?
    @dogs = @dogs.filter_by_type(params[:dog_type]) if params[:dog_type].present?
    @dogs = @dogs.page(params[:page])  # Add this line for kaminari
  end



  def show
    @dog = Dog.find(params[:id])
  end
end
