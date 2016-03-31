Rails.application.routes.draw do
  root to: 'leaderboard#index'

  resources :climbs, except: [:new, :edit]
  resources :users,  except: [:new, :edit] do
    resources :climbs, only: :index
  end

  get '/leaderboard', to: 'leaderboard#index'

  get(
    '/leaderboard/:year',
    to:   'leaderboard#show',
    as:   :annual_leaderboard,
    year: /\d{4}/
  )

  get(
    '/leaderboard/:year/:month',
    to:    'leaderboard#show',
    as:    :monthly_leaderboard,
    year:  /\d{4}/,
    month: /\d{1,2}/
  )

  get(
    '/leaderboard/:year/:month/:day',
    to:    'leaderboard#show',
    as:    :daily_leaderboard,
    year:  /\d{4}/,
    month: /\d{1,2}/,
    day:   /\d{1,2}/
  )
end
