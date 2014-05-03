# A sample Gemfile
source 'https://rubygems.org'

gem 'grape', '~> 0.7.0'
gem 'puma'
gem 'rake'
gem 'rack-ssl-enforcer'
gem 'bson_ext', '~> 1.10.0', :require => 'mongo' 
gem 'mongo_mapper', '~> 0.13.0', :require => 'mongo_mapper'

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
  gem 'factory_girl'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
end
