class CartController < ApplicationController
  before_action :initialize_cart

  def add_to_cart
    dog = Dog.find(params[:dog_id])
    item = {
      dog_id: dog.id,
      name: dog.name,
      # adoption_years: params[:adoption_years],
      breed: dog.breed,
      dog_type: dog.dog_type,
      price: dog.price,
      photo_url: dog.photo_url
    }
    session[:cart] << item
    redirect_to cart_path, notice: 'Added to cart'
  end

  def show
    Rails.logger.debug "Cart contents before setting @cart: #{session[:cart].inspect}"
    @cart = session[:cart]
    Rails.logger.debug "Cart contents after setting @cart: #{@cart.inspect}"
  end

  def remove_from_cart
    puts "Removing from cart: #{params.inspect}"
    dog_id = params[:dog_id].to_i
    session[:cart].reject! { |item| item["dog_id"].to_s == params[:dog_id] }
    redirect_to cart_path, notice: 'Dog removed from cart.'
  end

  private

  def initialize_cart
    Rails.logger.debug "Initializing cart with session[:cart] = #{session[:cart].inspect}"
    session[:cart] ||= []
  end
end
