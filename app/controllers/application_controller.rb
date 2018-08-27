class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  add_flash_types :success, :danger

  private

    def user_not_authorized
      flash[:danger] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
