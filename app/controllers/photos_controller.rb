class PhotosController < ApplicationController
  before_action :set_photo, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      redirect_to photo_path(@photo), notice: '保存できた'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def show
  end

  private
  def photo_params
    params.require(:photo).permit(:content, pics: [])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
