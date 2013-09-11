class ApplicationController < ActionController::Base
  before_filter :ensure_user_is_authenticated

  def self.skip_user_authentication(opts = {})
    skip_before_filter :ensure_user_is_authenticated, opts
  end

  def user_session
    @user_session ||= UserSession.new(self, :user_id, User)
  end

  private

  def ensure_user_is_authenticated
    unless current_user
      redirect_to login_path, alert: t(:"sessions.must_authenticate")
    end
  end

  def current_user
    user_session.user
  end
  helper_method :current_user
end
