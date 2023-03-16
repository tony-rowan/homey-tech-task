class SessionsController < ApplicationController
  def new
    @session_authentication = SessionAuthentication.new
  end

  def create
    @session_authentication =
      SessionAuthentication.new(session_authentication_params)

    if @session_authentication.valid?
      authenticate_user(@session_authentication.user)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    clear_authenticated_user
    redirect_to new_session_path
  end

  private

  def session_authentication_params
    params.require(:session_authentication).permit(:username, :password)
  end
end
