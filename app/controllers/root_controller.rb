class RootController < ApplicationController
  def show
    if logged_out?
      redirect_to new_session_path
    end
  end
end
