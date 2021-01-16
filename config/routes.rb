# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # resources :informations, only: %i[index]
      post 'informations/weather/forecast/complete', to: 'informations#complete'
      post 'informations/weather/forecast/current', to: 'informations#current'
      post 'informations/weather/forecast/next-days', to: 'informations#nextdays'
    end
  end
end
