MongoMapper.connection = Mongo::Connection.new(ENV['MONGO_CONNECTION'] || 'localhost')
MongoMapper.database   = ENV['MONGO_DB'] || "#{Halda.env}_halda"
