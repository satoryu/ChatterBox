class OauthController < ApplicationController
  skip_before_action :require_login, raise: false

  def create
    login_at(:twitter)
  end

  def destroy
    logout

    redirect_to root_path
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
        return
      end
    end

    # NOTE: @access_token is provided by Sorcery.
    #       https://github.com/NoamB/sorcery/issues/143#issuecomment-19602346
    if @user.access_token.blank?
      @user.create_access_token(token: access_token.token, secret: access_token.secret, provider: 'twitter')
    else
      @user.access_token.update_attributes(token: access_token.token, secret: access_token.secret, provider: 'twitter')
    end
  end
end
