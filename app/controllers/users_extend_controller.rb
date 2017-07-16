class UsersExtendController < ApplicationController

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = "Utilisateur supprimé."
      redirect_back(fallback_location: users_chat_rooms_path)
    end
  end

  def update
      user = User.find(params[:id])

      if user.has_role? :admin
          user.remove_role :admin
      else
          user.add_role :admin
      end
      redirect_to users_chat_rooms_path
  end

end
