class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		if admin_signed_in?
	    　　admin_top_path
	    else
	    	root_path
	    end
	end

	def after_sign_out_path_for(resource)
		if admin_signed_in?
	    　　new_admin_session_path
	    else
    	    root_path
    	end
	end
end
