class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update]

  def show
    @user = User.find(params[:id])
    # The show action remains mostly empty if you're just using it to display the form
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :address, :province_id, :image)  # Add other attributes as needed
  end
end
