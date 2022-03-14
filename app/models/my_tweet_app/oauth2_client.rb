module MyTweetApp
  class Oauth2Client
    SITE = 'https://arcane-ravine-29792.herokuapp.com/'

    def authorize_url(redirect_uri:)
      client.authorize_url(redirect_uri: redirect_uri)
    end

    def token(code:, redirect_uri:)
      client.token(code: code, redirect_uri: redirect_uri)
    end

    private

    def client
      @client ||=
        ::Oauth2Client.new(
          client_id: Rails.application.credentials.my_tweet_app.oauth.client_id,
          client_secret: Rails.application.credentials.my_tweet_app.oauth.client_secret,
          site: SITE
        )
    end
  end
end
