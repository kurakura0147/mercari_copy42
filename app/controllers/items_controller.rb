class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @user = current_user.id
  end

  def new
  end

  def show
  end

end
