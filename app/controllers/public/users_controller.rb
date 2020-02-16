class Public::UsersController < ApplicationController
	def show
		@user = User.find(current_user.id)
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		user = User.find(current_user.id)
		#flash[:success] = 'You have updated user successfully.'
		if user.update(user_params)
			if user.user_status == true
				#redirect_to controller: 'devise/sessions', action: 'destroy'
				#redirect_to destroy_user_session_path
				redirect_to root_path
			else
				redirect_to public_users_path
			end
		else
			@user = user
			render action: :edit
		end
	end

	def confirm
		@user = User.find(current_user.id)
	end

    private
    def user_params
    	added_attrs = [:first_name, :last_name, :first_name_kata, :last_name_kata, :email, :street_address, :postal_code, :phone_number, :user_status]
        params.require(:user).permit(added_attrs)
    end
end
