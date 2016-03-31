Rails.application.routes.draw do
  root to: 'leaderboard#index'

  resources :climbs, except: [:new, :edit]
  resources :users,  except: [:new, :edit] do
    resources :climbs, only: :index
  end

  scope '/leaderboard' do
    root to: 'leaderboard#index', as: :leaderboard

    get(
      '/:date_range',
      to:         'leaderboard#index',
      as:         :leaderboard_date_range,
      date_range: DateFormats::ISO_DATETIME_RANGE
    )

    get(
      '/:year',
      to:   'leaderboard#index',
      as:   :leaderboard_annual,
      year: DateFormats::YEAR
    )

    get(
      '/:year/:month',
      to:    'leaderboard#index',
      as:    :leaderboard_monthly,
      year:  DateFormats::YEAR,
      month: DateFormats::MONTH
    )

    get(
      '/:year/:month/:day',
      to:    'leaderboard#index',
      as:    :leaderboard_daily,
      year:  DateFormats::YEAR,
      month: DateFormats::MONTH,
      day:   DateFormats::DAY
    )
  end
end
