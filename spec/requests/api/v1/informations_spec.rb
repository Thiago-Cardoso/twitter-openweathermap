# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Informations', type: :request do
  headers = { 'ACCEPT' => 'application/json' }
  id = ENV.fetch('OPENWEATHERMAP_TOKEN')

  describe 'POST /api/v1/informations/weather/forecast/complete' do
    context '#complete' do
      context 'return 200 OK response' do
        before do
          post '/api/v1/informations/weather/forecast/complete',
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
        end
        it 'When send only param id' do
          expect(response).to have_http_status(200)
        end

        it 'When send params: id and city' do
          expect(response).to have_http_status(200)
        end
      end

      context 'return valid schema JSON' do
        it 'When structure is valid' do
          post '/api/v1/informations/weather/forecast/complete',
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
          expect(response.body).to match_response_schema('information')
        end

        it 'When has key message' do
          post '/api/v1/informations/weather/forecast/complete',
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
          post '/api/v1/informations/weather/forecast/complete',
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
        before do
          post '/api/v1/informations/weather/forecast/current',
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
        end
        it 'When send only param id' do
          expect(response).to have_http_status(200)
        end

        it 'When send params: id and city' do
          expect(response).to have_http_status(200)
        end
      end

      context 'return valid schema JSON' do
        it 'When structure is valid' do
          post '/api/v1/informations/weather/forecast/current',
               params: {
                 id: id
               },
               headers: headers
          expect(response.body).to match_response_schema('information')
        end

        it 'When has key message' do
          post '/api/v1/informations/weather/forecast/current',
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
          post '/api/v1/informations/weather/forecast/current',
               params: {},
               headers: headers

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end

  describe 'POST /api/v1/informations/weather/forecast/nextdays' do
    context '#nextdays' do
      context 'return 200 OK response' do
        before do
          post '/api/v1/informations/weather/forecast/nextdays',
               params: {
                 id: id
               },
               headers: headers
        end
        it 'When send only param id' do
          expect(response).to have_http_status(200)
        end

        it 'When send params: id and city' do
          expect(response).to have_http_status(200)
        end
      end

      context 'return valid schema JSON' do
        before do
          post '/api/v1/informations/weather/forecast/nextdays',
               params: {
                 id: id,
                 city: 'Lajeado'
               },
               headers: headers
        end
        it 'When structure is valid' do
          expect(response.body).to match_response_schema('information')
        end

        it 'When has key message' do
          body_as_json = JSON.parse(response.body)
          expect(body_as_json.keys).to match_array(['message'])
        end
      end

      context 'return 422 unprocessable_entity response' do
        it 'When invalid params' do
          post '/api/v1/informations/weather/forecast/nextdays',
               params: {},
               headers: headers

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end
