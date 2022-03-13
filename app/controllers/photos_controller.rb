class PhotosController < ApplicationController
  def index
    @photos = current_user.photos.order(created_at: :desc)
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to photos_path, notice: 'アップロードしました' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :file)
  end
end
