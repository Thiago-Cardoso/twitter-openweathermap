# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Informations', type: :request do
  headers = { 'ACCEPT' => 'application/json' }
  id = ENV.fetch('OPENWEATHERMAP_TOKEN')

  describe 'POST /api/v1/informations/weather/forecast/complete' do
    context '#complete' do
      context 'return 200 OK response' do
        it 'When send only param id' do
          post api_v1_informations_weather_forecast_complete_path,
               params: {
                 id: id
               },
               headers: headers

          expect(response).to have_http_status(200)
        end

        it 'When send params: id and city' do
          post api_v1_informations_weather_forecast_complete_path,
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
          expect(response).to have_http_status(200)
        end
      end

      context 'return valid schema JSON' do
        it 'When structure is valid' do
          post api_v1_informations_weather_forecast_complete_path,
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
          expect(response.body).to match_response_schema('information')
        end

        it 'When has key message' do
          post api_v1_informations_weather_forecast_complete_path,
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers

          body_as_json = JSON.parse(response.body)
          expect(body_as_json.keys).to match_array(['message'])
        end
      end

      context 'return 422 unprocessable_entity response' do
        it 'When invalid params' do
          post api_v1_informations_weather_forecast_complete_path,
               params: {},
               headers: headers

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'POST /api/v1/informations/weather/forecast/current' do
    context '#current' do
      context 'return 200 OK response' do
        it 'When send only param id' do
          post api_v1_informations_weather_forecast_current_path,
               params: {
                 id: id
               },
               headers: headers

          expect(response).to have_http_status(200)
        end

        it 'When send params: id and city' do
          post api_v1_informations_weather_forecast_current_path,
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
          expect(response).to have_http_status(200)
        end
      end

      context 'return valid schema JSON' do
        it 'When structure is valid' do
          post api_v1_informations_weather_forecast_current_path,
               params: {
                 id: id
               },
               headers: headers
          expect(response.body).to match_response_schema('information')
        end

        it 'When has key message' do
          post api_v1_informations_weather_forecast_current_path,
               params: {
                 id: id
               },
               headers: headers

          body_as_json = JSON.parse(response.body)
          expect(body_as_json.keys).to match_array(['message'])
        end
      end

      context 'return 422 unprocessable_entity response' do
        it 'When invalid params' do
          post api_v1_informations_weather_forecast_current_path,
               params: {},
               headers: headers

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'POST /api/v1/informations/weather/forecast/next-days' do
    context '#nextdays' do
      context 'return 200 OK response' do
        it 'When send only param id' do
          post api_v1_informations_weather_forecast_next_days_path,
               params: {
                 id: id
               },
               headers: headers

          expect(response).to have_http_status(200)
        end

        it 'When send params: id and city' do
          post api_v1_informations_weather_forecast_next_days_path,
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
          expect(response).to have_http_status(200)
        end
      end

      context 'return valid schema JSON' do
        it 'When structure is valid' do
          post api_v1_informations_weather_forecast_next_days_path,
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
          expect(response.body).to match_response_schema('information')
        end

        it 'When has key message' do
          post api_v1_informations_weather_forecast_next_days_path,
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers

          body_as_json = JSON.parse(response.body)
          expect(body_as_json.keys).to match_array(['message'])
        end
      end

      context 'return 422 unprocessable_entity response' do
        it 'When invalid params' do
          post api_v1_informations_weather_forecast_next_days_path,
               params: {},
               headers: headers

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
