class LeaderboardController < ApplicationController
  before_action :set_leaderboard, only: [:index, :show]

  def index
    render json: @users
  end

  def show
    render json: @users
  end

  private

  def set_leaderboard
    year  = params[:year]
    week  = params[:week]
    month = params[:month]
    day   = params[:day]

    daterange = (
      case
      when day.present?
        date = Date.new(year.to_i, month.to_i, day.to_i)
        (date.beginning_of_day..date.end_of_day)

      when month.present?
        date = Date.new(year.to_i, month.to_i)
        (date.beginning_of_month..date.end_of_month)

      when week.present?
        date = Date.commercial(year.to_i, week.to_i)
        (date.beginning_of_week..date.end_of_week)

      when year.present?
        date = Date.new(year.to_i)
        (date.beginning_of_year..date.end_of_year)
      end
    )

    @users = User.all.with_total_flights(daterange).order('total_flights DESC')
  end
end
