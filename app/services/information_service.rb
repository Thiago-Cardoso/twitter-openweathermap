# frozen_string_literal: true

class InformationService
  def initialize(id, city = 'Santa Cruz do Sul')
    @id = id
    @city = city
  end

  def call
    OpenWeatherMap::Auth.new(@id, @city)
  end

  def format_current_forecast(current_weather)
    message = "#{current_weather[:current_weather][:temp]}°C e #{current_weather[:current_weather][:description]} em #{current_weather[:current_weather][:city]} "
    message += "em #{current_weather[:current_weather][:date]}. "
    { message: message }
  end

  def format_next_five_forecast(next_five_forecast_days)
    message = "Média para os próximos dias em (#{@city}): "
    next_five_forecast_days[:next_five_weather].each do |day, temp|
      average = temp.reduce(:+) / temp.count
      message += "#{average}°C em #{day}, "
    end
    { message: message }
  end

  def format_complete_forecast(current_weather, next_weather_forecast)
    message = "#{current_weather[:current_weather][:temp]}°C e #{current_weather[:current_weather][:description]} em #{current_weather[:current_weather][:city]} "
    message += "em #{current_weather[:current_weather][:date]}. Média para os próximos dias: "

    next_weather_forecast[:next_five_weather].each do |day, temp|
      next if current_weather[:date].to_s == day.to_s

      average = temp.reduce(:+) / temp.count
      message += "#{average}°C em #{day}, "
    end
    # format_massage = message.gsub(/[\&,]/, '.')
    { message: message }
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
