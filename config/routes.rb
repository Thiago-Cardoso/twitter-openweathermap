# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :informations, only: %i[index]
      post 'informations/weather/forecast/complete', to: 'informations#forecast_complete'
      post 'informations/weather/forecast/current', to: 'informations#forecast_current'
      post 'informations/weather/forecast/nextdays', to: 'informations#forecast_nextdays'
    end
  end
end
