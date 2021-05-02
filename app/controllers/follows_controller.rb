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
    render json: follow
  end

  def create
    #フォローするためのメソッド
    current_user.follow!(params[:account_id])
    redirect_to account_path(params[:account_id])
  end
end
