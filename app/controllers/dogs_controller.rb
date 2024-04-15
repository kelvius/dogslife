# frozen_string_literal: true

# app/controllers/dogs_controller.rb
class DogsController < ApplicationController
  def index
    #   dogs = Dog.order(created_at: :desc)  # Start with all dogs ordered by creation date

    #   # Apply filters

    #   # Apply keyword search
    #   dogs = dogs.search_by_keyword(params[:keyword]) if params[:keyword].present?
    #   dogs = dogs.filter_by_type(params[:dog_type]) if params[:dog_type].present?

    #   # Filter by availability
    #   if params[:available_for_adoption].present?
    #     available = params[:available_for_adoption] == 'true'
    #     dogs = dogs.where(available_for_adoption: available)
    #   end

    #   # Filter by arrival
    #   if params[:arrival_filter] == 'new_arrivals'
    #     dogs = dogs.where('created_at >= ?', 3.days.ago)
    #   end

    #   # Apply pagination
    #   @dogs = dogs.page(params[:page]).per(10)
    # end

    # def show
    #   @dog = Dog.find(params[:id])
    # end
    @dogs = Dog.order(created_at: :desc).page(params[:page]).per(10)

    # Keyword search
    @dogs = @dogs.search_by_keyword(params[:keyword]) if params[:keyword].present?

    # Dog type filter
    @dogs = @dogs.filter_by_type(params[:dog_type]) if params[:dog_type].present?

    # Availability filter
    @dogs = @dogs.where(available_for_adoption: params[:available_for_adoption] == 'true') if params[:available_for_adoption].present?

    # Arrival and update time filter
    case params[:filter_time_and_price]
    when 'new_arrivals'
      @dogs = @dogs.where('created_at > ?', 3.days.ago)
    when 'recently_updated'
      @dogs = @dogs.where('updated_at > ?', 3.days.ago)
    when 'free_dogs'
      @dogs = @dogs.where(price: 0)
    end

    @dogs = @dogs.page(params[:page])
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

  # Implement this method to perform a keyword search across multiple fields
  def search_by_keyword(keyword)
    # Assuming you have a method in your Dog model that handles the keyword search
    Dog.search_by_keyword(keyword)
  end
end
