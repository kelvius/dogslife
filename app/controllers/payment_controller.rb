# frozen_string_literal: true

class PaymentController < ApplicationController
  include CartHelper
  include PaymentHelper

  def index
    logger.debug(cart)
  end

  def new; end

  def create
    items = []

    cart.each do |item|
      adoption_years = item['adoption_years'].to_i
      total_price_for_duration = item['price'].to_d * adoption_years
      logger.debug("#{total_price_for_duration} total price for #{adoption_years} year(s)")
      items.push(name: item['name'], unit_amount: (total_price_for_duration * 100).round, quantity: 1)
    end

    items.push(name: 'GST', unit_amount: (gst_charged * 100).round, quantity: 1)
    items.push(name: 'PST', unit_amount: (pst_charged * 100).round, quantity: 1)
    items.push(name: 'HST', unit_amount: (hst_charged * 100).round, quantity: 1) if hst_charged > 0

    line_items = items.map do |item|
      {
        price_data: {
          currency: 'cad',
          product_data: {
            name: item[:name]
          },
          unit_amount: item[:unit_amount]
        },
        quantity: 1
      }
    end

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      success_url: "#{payment_success_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: payment_cancel_url,
      mode: 'payment',
      line_items:
    )
    redirect_to @session.url, allow_other_host: true
  end

  def success
    session[:cart] = {}
    session[:cart_count] = 0
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end



  def cancel; end
end
