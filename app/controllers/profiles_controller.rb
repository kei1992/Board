class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.prepare_profile
  end

  def registration
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to boards_path
    else
      flash.now[:error] = 'Failed Updated'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(
      :nickname,
      :introduction,
      :avatar
    )
  end
end
