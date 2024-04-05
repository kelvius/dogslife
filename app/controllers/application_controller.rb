class ApplicationController < ActionController::Base
  # Other methods...

  private

  # Redirect to login page after logout
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
