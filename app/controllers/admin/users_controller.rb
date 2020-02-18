class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
	def index
		@users = User.page(params[:page]).per(10)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id)
    else
      render 'edit'
    end
  end

  private

  def user_params
    	added_attrs = [:first_name, :last_name, :first_name_kata, :last_name_kata, :email, :street_address, :postal_code, :phone_number, :user_status]
        params.require(:user).permit(added_attrs)
    end
end
