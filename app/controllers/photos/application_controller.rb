module Photos
  class ApplicationController < ::ApplicationController
    before_action :set_photo

    private

    def set_photo
      @photo = current_user.photos.find(params[:photo_id])
    end
  end
end
