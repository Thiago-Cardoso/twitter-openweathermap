# frozen_string_literal: true

module Api
  module V1
    class InformationsController < Api::V1::ApiController
      def forecast_complete
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        openweather  = info_service.call
        complete_forecast_json = openweather.complete_forecast
        message_temp = info_service.format_complete_forecast(
          complete_forecast_json[0],
          complete_forecast_json[1]
        )
        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end

      def forecast_current
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        openweather  = info_service.call
        message_temp = info_service.format_current_forecast(
          openweather.current_forecast
        )

        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end

      def forecast_nextdays
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        openweather  = info_service.call
        message_temp = info_service.format_next_five_forecast(
          openweather.next_five_forecast
        )

        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end
    end
  end
end
