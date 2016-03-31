Rails.application.routes.draw do
  scope '/v1' do
    resources :climbs, except: [:new, :edit]
    resources :users, except: [:new, :edit] do
      resources :climbs, except: [:new, :edit]
    end
  end
end
