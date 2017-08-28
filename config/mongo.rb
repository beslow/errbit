log_level = Logger.const_get Errbit::Config.log_level.upcase

Mongoid.logger.level = log_level
Mongo::Logger.level = log_level

Mongoid.configure do |config|
  uri = if Errbit::Config.mongo_url == 'mongodb://localhost'
          "mongodb://127.0.0.1:27017/errbit_#{Rails.env}"
        else
          Errbit::Config.mongo_url
        end

  config.load_configuration(
    clients: {
      default: {
        uri: uri
      }
    },
    options: {
      use_activesupport_time_zone: true
    }
  )
end
