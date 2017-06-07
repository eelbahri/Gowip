class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :first_name, :last_name, :pseudo) }
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :first_name, :last_name, :pseudo) }
        end
end
