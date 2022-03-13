module PhotosHelper
  def photo_file_path(photo)
    photo_path(photo, format: photo.file.blob.filename.extension)
  end

  def photo_file_url(photo)
    photo_url(photo, format: photo.file.blob.filename.extension)
  end
end
