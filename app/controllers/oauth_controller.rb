class OauthController < ApplicationController
  skip_before_action :require_login, raise: false

  def oauth
    login_at(:twitter)
  end

  def callback
    if @user = login_from(:twitter)
      redirect_to root_path, notice: 'Logged in'
    else
      begin
        @user = create_from(:twitter)
        reset_session
        auto_login(@user)
        redirect_to root_path, notice: 'Sign up'
      rescue exception
        Rails.logger.error exception.message
        redirect_to root_path, alert: 'Failed to login'
      end
    end
  end
end
