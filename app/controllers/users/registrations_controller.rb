# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  # Other controller actions...

  protected

  # Prevent automatic sign-in after sign-up
  def sign_up(resource_name, resource)
    true
  end
end
