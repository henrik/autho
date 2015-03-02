class SessionController < ApplicationController
  skip_user_authentication only: [:new]

  def new
  end

  def create
    if user = Autho::Authentication.new(User, params[:email], params[:password]).user
      user_session.user = user
      redirect_to root_path, notice: t(:"sessions.successfully_signed_in")
    else
      redirect_to :back, error: t(:"sessions.bad_credentials")
    end
  end
end

