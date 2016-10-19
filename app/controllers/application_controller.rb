class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  if !Rails.env.test?
    http_basic_authenticate_with name: ENV["associazione_name"],
                               password: ENV["associazione_password"]
  end
  before_action {I18n.locale = :en}
end
