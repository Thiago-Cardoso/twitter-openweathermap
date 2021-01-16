# frozen_string_literal: true

require 'rails_helper'

describe InformationService do
  describe 'When call service' do
    context '#call' do
      it 'With valid params' do
        info_service = InformationService.new(ENV.fetch('OPENWEATHERMAP_TOKEN')).call
        expect(info_service).present?
      end

      it 'With invalid params' do
        expect { InformationService.new.call }.to raise_error(ArgumentError)
      end
    end

    context '#publish_twitter_message' do
      it 'With success authenticate' do
        info_service = InformationService.new(ENV.fetch('OPENWEATHERMAP_TOKEN'))
        twitter_response = info_service.publish_twitter_message('TESTE')
        expect(twitter_response).present?
      end
    end
  end
end
