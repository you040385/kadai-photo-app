require 'uri'
require 'net/http'

class Oauth2Client
  def initialize(client_id:, client_secret:, site:)
    @client_id = client_id
    @client_secret = client_secret
    @site = URI.parse(site)
  end

  def authorize_url(path: 'oauth/authorize', redirect_uri:)
    uri = site + path
    uri.query = URI.encode_www_form(
      {
        client_id: client_id,
        response_type: 'code',
        redirect_uri: redirect_uri,
        scope: '',
        state: ''
      }
    )

    uri.to_s
  end

  def token(path: 'oauth/token', code:, redirect_uri:)
    uri = site + path
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    req = Net::HTTP::Post.new(uri.path)
    req.set_form_data(
      {
        code: code,
        client_id: client_id,
        client_secret: client_secret,
        response_type: 'code',
        redirect_uri: redirect_uri,
        grant_type: 'authorization_code'
      }
    )

    res = http.request(req)
    if res.code == "200"
      parsed = JSON.parse(res.body)
      parsed['access_token']
    else
      nil
    end
  end

  private

  attr_reader :client_id, :client_secret, :site
end
