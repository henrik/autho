class SessionController < ApplicationController
  skip_user_authentication only: [:new]

  def new
  end

  def create
    if user = Autho::Authentication.new(User, params[:email], params[:password]).user
      Autho::UserSession.new(self, :user_id, User).user = user
      redirect_to root_path, flash: { notice: t(:"sessions.successfully_signed_in") }
    else
      redirect_to :back, flash: { error: t(:"sessions.bad_credentials") }
    end
  end
end

