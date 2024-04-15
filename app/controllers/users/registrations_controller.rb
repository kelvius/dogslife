# frozen_string_literal: true

# app/controllers/users/registrations_controller.rb
module Users
  class RegistrationsController < Devise::RegistrationsController
    # Other controller actions...

    protected

    # Prevent automatic sign-in after sign-up
    def sign_up(_resource_name, _resource)
      true
    end
  end
end
