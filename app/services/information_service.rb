# frozen_string_literal: true

class InformationService
  def initialize(id, city)
    @id = id
    @city = city
  end

  def openweather_forecast_complete
    openweather = OpenWeatherMap::Auth.new(@id, @city)
    openweather.complete_forecast
  end

  def openweather_forecast_current
    openweather = OpenWeatherMap::Auth.new(@id, @city)
    openweather.current_forecast
  end

  def openweather_forecast_next_five_days
    openweather = OpenWeatherMap::Auth.new(@id, @city)
    openweather.next_five_forecast
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
