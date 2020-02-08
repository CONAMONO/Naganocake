class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    	root_path # ログイン後に遷移するpathを設定
	end

	def after_sign_out_path_for(resource)
    	flash[:notice] = "ログアウトしました"
    	root_path  # ログアウト後に遷移するpathを設定
	end
  
  protected
  def configure_permitted_parameters
  	added_attrs = [ :first_name, :last_name, :first_name_kata, :last_name_kata, :street_address, :postal_code, :phone_number, :user_status, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
