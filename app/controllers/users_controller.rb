class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def index

  end

  def update
  end

  def destroy
  end
end
