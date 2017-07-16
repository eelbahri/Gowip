class UsersExtendController < ApplicationController

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = "Utilisateur supprimé."
      redirect_back(fallback_location: users_chat_rooms_path)
    end
  end

end
