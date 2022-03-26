# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = %i[
      email password password_confirmation remember_me
      postal_code address self_description
    ]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
