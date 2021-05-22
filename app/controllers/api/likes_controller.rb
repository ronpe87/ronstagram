class Api::LikesController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :set_like
  before_action :like_counts

  # def show
  #   photo = Photo.find(params[:photo_id])
  #   like_status = current_user.has_liked?(photo)
  #   render json: { hasLiked: like_status, likeCount: like_counts }.to_json
  # end

  def create
    photo = Photo.find(params[:photo_id])
    photo.likes.create!(user_id: current_user.id)
    # redirect_to root_path
    render json: { status: 'ok', likeCount: like_counts }.to_json
  end

  def destroy
    photo = Photo.find(params[:photo_id])
    like = photo.likes.find_by!(user_id: current_user.id)

    like.destroy!

    # redirect_to root_path
    render json: { status: 'ok', likeCount: like_counts }.to_json
  end

  private

  def set_like
    @photo = Photo.find(params[:photo_id])
  end

  def like_counts
    @like_count = @photo.likes.count
  end
end
