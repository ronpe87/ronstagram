class Api::LikesController < Api::ApplicationController
  before_action :authenticate_user!

  def show
    photo = Photo.find(params[:photo_id])
    like_status = current_user.has_liked?(photo)
    render json: { hasLiked: like_status }
  end

  def create
    photo = Photo.find(params[:photo_id])
    photo.likes.create!(user_id: current_user.id)
    # redirect_to root_path
    render json: { status: 'ok' }
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    like = photo.likes.find_by!(user_id: current_user.id)

    like.destroy!

    # redirect_to root_path
    render json: { status: 'ok' }
  end
end
