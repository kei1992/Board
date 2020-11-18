class ApplicationController < ActionController::Base
	def after_sign_up_path_for(resource)
    edit_profile_path
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      new_admin_update_path
    else
      boards_path
    end
  end

  def after_sign_out_path_for(resource)
    boards_path
  end
end
