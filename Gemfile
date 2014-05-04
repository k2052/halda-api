# A sample Gemfile
source 'https://rubygems.org'
ruby "2.0.0"

gem 'grape', '~> 0.7.0'
gem 'puma'
gem 'rake'
gem 'rack-ssl-enforcer'
gem 'rack-cors', require: 'rack/cors'
gem 'bson_ext', '~> 1.10.0', :require => 'mongo' 
gem 'mongo_mapper', '~> 0.13.0', :require => 'mongo_mapper'
gem 'omniauth-identity', require: 'omniauth-identity'
gem 'mongomapper_ext', "~> 0.5.0", git: 'git://github.com/k2052/mongomapper_ext.git', require: 'mongomapper_ext'
gem 'imperator'
gem 'resque-status'
gem 'metainspector', require: 'metainspector'

group :development do
  gem 'rerun'
end

group :test do
  gem 'rspec'
  gem 'rack-test', require: 'rack/test'
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'rb-inotify', '~> 0.8.8', require: false
  gem 'ffaker', require: 'ffaker'
  gem 'factory_girl'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
end
