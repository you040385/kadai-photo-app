module Oauth
  class MyTweetAppController < ApplicationController
    include MyTweetAppHelper

    before_action :authenticate

    REDIRECT_URI = 'http://localhost:3000/oauth/callback'

    def create
      redirect_to photos_path if my_tweet_app_enabled?

      oauth_client = MyTweetApp::Oauth2Client.new
      redirect_to oauth_client.authorize_url(redirect_uri: REDIRECT_URI), allow_other_host: true
    end

    def callback
      oauth_client = MyTweetApp::Oauth2Client.new
      access_token = oauth_client.token(code: params[:code], redirect_uri: REDIRECT_URI)
      message =
        if access_token
          enable_my_tweet_app(access_token)
          { notice: 'MyTweetApp と連携しました' }
        else
          { alert: 'MyTweetApp と連携できませんでした' }
        end

      redirect_to photos_path, message
    end

    private

    def photo_params
      params.require(:photo).permit(:title, :file)
    end
  end
end
