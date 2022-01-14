class StaticController < ApplicationController
  skip_before_action :user_verified, only: [:home]

  def home
  end
end