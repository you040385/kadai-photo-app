class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def authenticate
    redirect_to root_path unless logged_in?
  end
end
