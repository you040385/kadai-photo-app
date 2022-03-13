module MyTweetAppHelper
  def enable_my_tweet_app(access_token)
    session[:user_session]['my_tweet_app_token'] = access_token
  end

  def my_tweet_app_enabled?
    session[:user_session]['my_tweet_app_token'].present?
  end
end
