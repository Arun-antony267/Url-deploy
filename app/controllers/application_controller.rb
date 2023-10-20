class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :success
    skip_before_action :verify_authenticity_token
    
end
