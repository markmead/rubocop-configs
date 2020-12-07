class RegistrationsController < Devise::RegistrationsController
  before_action :configure_account_update_params, only: :update
  before_action :configure_sign_up_params, only: :create

protected

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %w[email current_password password password_confirmation username])
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %w[email password password_confirmation username])
  end
end
