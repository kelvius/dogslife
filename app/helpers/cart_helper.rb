# frozen_string_literal: true

module CartHelper
  def cart
    session[:cart]
  end
end
