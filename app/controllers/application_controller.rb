class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render json:  { status: "Access denied." }
  end
end
