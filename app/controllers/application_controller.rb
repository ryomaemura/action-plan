class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include SessionsHelper

  private

  def require_user_is_login
    unless is_login
      redirect_to login_url
    end
  end
end
