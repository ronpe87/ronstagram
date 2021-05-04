class UnfollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    #フォローを外すためのメソッド
    current_user.unfollow!(params[:account_id])
    #redirect_to account_path(params[:account_id])

    render json: { status: 'ok' }
  end
end
