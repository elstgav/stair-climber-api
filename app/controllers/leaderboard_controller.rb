class LeaderboardController < ApplicationController
  include DateRange

  before_action :set_leaderboard, only: [:index, :show]

  def index
    render json: @users
  end

  def show
    render json: @users
  end

  private

  def set_leaderboard
    @users = User.all.with_total_flights(date_range).order('total_flights DESC')
  end
end
