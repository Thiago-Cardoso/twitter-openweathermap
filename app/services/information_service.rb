# frozen_string_literal: true

class InformationService
  def initialize(id, city = 'Santa Cruz do Sul')
    @id = id
    @city = city
  end

  def call
    OpenWeatherMap::Auth.new(@id, @city)
  end

  def publish_twitter_message(message)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch('TWITTER_CONSUMER_KEY')
      config.consumer_secret     = ENV.fetch('TWITTER_CONSUMER_SECRET')
      config.access_token        = ENV.fetch('TWITTER_ACCESS_TOKEN')
      config.access_token_secret = ENV.fetch('TWITTER_ACCESS_TOKEN_SECRET')
    end
    client.update(message)
  end
end
