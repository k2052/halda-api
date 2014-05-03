$:.unshift File.dirname(__FILE__)
env = (ENV['RACK_ENV'] || :development)

require 'bundler'
Bundler.require :default, env.to_sym

db_config = YAML::load("./config/db.yml")

mongo = db_config[env]
MongoMapper.connection = Mongo::Connection.new(ENV['MONGO_CONNECTION'] || 'localhost')
MongoMapper.database   = ENV['MONGO_DB'] || "#{env}_halda"

specific_environment = "config/envs/#{env}.rb"
require specific_environment if File.exists? specific_environment
Dir["config/initializers/**/*.rb"].each {|f| require f}
