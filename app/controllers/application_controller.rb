class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :success, :confirm
    protect_from_forgery with: :exception
    skip_before_action :verify_authenticity_token
  end
