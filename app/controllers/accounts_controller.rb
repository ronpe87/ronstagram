class AccountsController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to profile_path
    end
    @photos = @user.photos.all.order('updated_at DESC')
  end
end
