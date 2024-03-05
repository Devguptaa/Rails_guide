class SessionController < ApplicationController
  def destroy
    sign_out(current_user) # Sign out the currently logged in user
    redirect_to root_path, notice: 'You have been signed out successfully.'
  end
end
