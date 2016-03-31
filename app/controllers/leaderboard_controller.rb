class LeaderboardController < ApplicationController
  include DateRange

  before_action :set_leaderboard, only: [:index]

  def index
    render json: @users
  end

  private

  def set_leaderboard
    @users = User.all.with_total_flights(date_range).order('total_flights DESC')
  end
end
