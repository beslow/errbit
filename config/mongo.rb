log_level = Logger.const_get Errbit::Config.log_level.upcase

Mongoid.logger.level = log_level
Mongo::Logger.level = log_level

Mongoid.configure do |config|
  uri = 'mongodb://beslow:jiaren123456@errbit-shard-00-00-3h42w.mongodb.net:27017,errbit-shard-00-01-3h42w.mongodb.net:27017,errbit-shard-00-02-3h42w.mongodb.net:27017/errbit_production?replicaSet=ERRBIT-shard-0&authSource=admin'
      # if Errbit::Config.mongo_url == 'mongodb://localhost'
      #     "mongodb://127.0.0.1:27017/errbit_#{Rails.env}"
      #   else
      #     Errbit::Config.mongo_url
      #   end

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
