class Apps::ProfilesController < Apps::ApplicationController

  def show
    @profile = current_user.profile
    @current_user_photos = current_user.photos.all
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  private
  def profile_params
    params.fetch(:profile, {}).permit( #fetch=profileパラメータがない時は {} がデフォルト値
      :avatar
    )
  end
end
