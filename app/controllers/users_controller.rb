class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]

  def show
  end

  def new
  end

  def edit
  end

  def update
    if @user.update(edit_user_params)
      redirect_back(fallback_location: edit_user_path)
    else
      render edit_user_path
    end
  end

  def signout
  end

  def listing
    @items = Item.where(user_id: current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def edit_user_params
    params.require(:user).permit(:nickname, :profile)
  end



end
