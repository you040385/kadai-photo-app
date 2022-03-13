require 'uri'
require 'net/http'

class Tweet
  URL = 'https://arcane-ravine-29792.herokuapp.com/api/tweets'

  def initialize(token:, title:, url:)
    @token = token
    @title = title
    @url = url
  end

  def save
    return false if token.nil? || title.nil? || url.nil?

    uri = URI.parse(URL)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    req = Net::HTTP::Post.new(uri.path)
    req['Authorization'] = "bearer #{token}"
    req.content_type = 'application/json'
    req.body = { text: title, url: url }.to_json

    res = http.request(req)
    res.code == "201"
  end

  private

  attr_reader :token, :title, :url
end
