class Api::CommentsController < Api::ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    photo = Photo.find(params[:photo_id])
    comments = photo.comments
    render json: comments, include: { user: [ :profile] }
  end

  def create
    photo = Photo.find(params[:photo_id])
    @comment = photo.comments.build(comment_params.merge!(user_id: current_user.id))
    @comment.save!

    render json: @comment, include: { user: [ :profile] }
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
