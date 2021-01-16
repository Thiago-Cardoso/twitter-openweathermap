# frozen_string_literal: true

module Api
  module V1
    class InformationsController < Api::V1::ApiController
      def complete
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        openweather  = info_service.call
        message_temp = openweather.complete_forecast
        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end

      def current
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        openweather  = info_service.call
        message_temp = openweather.current_forecast
        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end

      def nextdays
        not_found if params[:id].empty?
        params[:city] = 'Santa Cruz do Sul' unless params[:city].present?

        info_service = InformationService.new(params[:id], params[:city])
        openweather  = info_service.call
        message_temp = openweather.next_five_forecast
        info_service.publish_twitter_message(message_temp[:message])

        render json: message_temp
      rescue StandardError => e
        render json: { errors: 'Error not passed id' }, status: :unprocessable_entity
      end
    end
  end
end
