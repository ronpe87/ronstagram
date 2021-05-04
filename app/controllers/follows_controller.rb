class FollowsController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.find(params[:account_id])
    @followers = user.followers
  end

  def show
    user = User.find(params[:account_id])
    @followers = user.followers
    @followings = user.followings
    follow_status = current_user.has_followed?(user)

    render json: { hasFollow: follow_status }
  end

  def create
    #フォローするためのメソッド
    current_user.follow!(params[:account_id])
    #redirect_to account_path(params[:account_id])

    render json: { status: 'ok' }
  end
end
