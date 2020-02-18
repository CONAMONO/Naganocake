class ApplicationController < ActionController::Base
  before_action :user_status_check!
  before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if admin_signed_in?
        $sign_in_user = "admin"
		    admin_top_path
		elsif user_signed_in?
        $sign_in_user = "user"
			  root_path

	  else
	    	root_path
	  end
	end

	def after_sign_out_path_for(resource)
    if $sign_in_user == "admin"
      new_admin_session_path
    else
      root_path
    end

		# if admin_signed_in?
	 #    　　new_admin_session_path
	 #    else
  #   	    root_path
  #   	end
	end

  protected
  def configure_permitted_parameters
  	added_attrs = [ :first_name, :last_name, :first_name_kata, :last_name_kata, :street_address, :postal_code, :phone_number, :user_status, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  private
  def user_status_check!
  	if user_signed_in?
  		if current_user.user_status
	  		sign_out
	    	flash[:alert] = "このユーザーは退会しています"
	    	redirect_to root_path
    	end
  	end
  end

  before_action :set_search

def set_search
    @search = Product.ransack(params[:q])
  if params[:q]
    @search_product = @search.result
  end
end
end
