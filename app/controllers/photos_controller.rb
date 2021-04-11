class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photos = Photo.new
  end

  def show
  end
end
