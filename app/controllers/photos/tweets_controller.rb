module Photos
  class TweetsController < ApplicationController
    include PhotosHelper
    include MyTweetAppHelper

    before_action :authenticate

    def create
      tweet = MyTweetApp::Tweet.new(token: my_tweet_app_token, title: @photo.title, url: photo_file_url(@photo))

      respond_to do |format|
        if tweet.save
          format.html { redirect_to photos_path, notice: 'ツイートしました' }
        else
          format.html { redirect_to photos_path, alert: 'ツイートできませんでした' }
        end
      end
    end
  end
end
