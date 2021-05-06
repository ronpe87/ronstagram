class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    @photos = Photo.where(user_id: user_ids)
    @ranks = Photo.joins(:likes).group(:id).order("count(likes.user_id) desc").limit(5)
  end
end
