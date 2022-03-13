module Oauth
  class MyTweetAppController < ApplicationController
    include MyTweetAppHelper

    before_action :authenticate

    SITE = 'https://arcane-ravine-29792.herokuapp.com/'
    REDIRECT_URI = 'http://localhost:3000/oauth/callback'

    def create
      redirect_to photos_path if my_tweet_app_enabled?

      redirect_to oauth_client.authorize_url(redirect_uri: REDIRECT_URI), allow_other_host: true
    end

    def callback
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

    def oauth_client
      Oauth2Client.new(client_id: client_id, client_secret: client_secret, site: SITE)
    end

    def client_id
      Rails.application.credentials.my_tweet_app.oauth.client_id
    end

    def client_secret
      Rails.application.credentials.my_tweet_app.oauth.client_secret
    end

    def photo_params
      params.require(:photo).permit(:title, :file)
    end
  end
end
