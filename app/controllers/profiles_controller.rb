class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
      @profile = current_user.profile
  end

  def edit
    # if current_user.profile.present?
    #   @profile = current_user.profile
    # else
    #   @profile = current_user.build_profile
    # end

    # ボッチ演算子
    # @profile = current_user.profile || current_user.build_profile

    #最終形態
    @profile = current_user.prepare_profile
  end

  def update
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        redirect_to profile_path, notice: 'Completed Updated'
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