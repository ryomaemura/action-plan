class ApplicationController < ActionController::Base

  private

  def require_user_is_login
    unless is_login
      redirect_to login_url
    end
  end
end
