# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  def index
    dogs = Dog.order(created_at: :desc)  # Start with all dogs ordered by creation date

    # Apply filters

    # Apply keyword search
    dogs = dogs.search_by_keyword(params[:keyword]) if params[:keyword].present?
    dogs = dogs.filter_by_type(params[:dog_type]) if params[:dog_type].present?

    # Filter by availability
    if params[:available_for_adoption].present?
      available = params[:available_for_adoption] == 'true'
      dogs = dogs.where(available_for_adoption: available)
    end

    # Filter by arrival
    if params[:arrival_filter] == 'new_arrivals'
      dogs = dogs.where('created_at >= ?', 3.days.ago)
    end

    # Apply pagination
    @dogs = dogs.page(params[:page]).per(10)
  end

  def show
    @dog = Dog.find(params[:id])
  end
end
