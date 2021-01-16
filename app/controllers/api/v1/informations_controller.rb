# frozen_string_literal: true

module Api
  module V1
    class InformationsController < Api::V1::ApiController
      def complete
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        message_temp = info_service.openweather_forecast_complete
        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: e }, status: :unprocessable_entity
        # render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end

      def current
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        message_temp = info_service.openweather_forecast_current
        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end

      def nextdays
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        message_temp = info_service.openweather_forecast_next_five_days
        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end
    end
  end
end
