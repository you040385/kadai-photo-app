class PhotosController < ApplicationController
  before_action :authenticate

  def index
    @photos = current_user.photos.order(created_at: :desc)
  end

  def show
    @photo = current_user.photos.find(params[:id])

    respond_to do |format|
      format.any(:png, :jpeg) do
        send_data @photo.file.download,
                  filename: @photo.file.filename.to_s,
                  type: @photo.file.blob.content_type
      end
    end
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
