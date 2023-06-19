class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render json:  { status: "Access denied." }
  end

  helper_method :admin?
  def admin?
    current_user && current_user.role == "admin"
  end

end
