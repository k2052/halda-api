require File.expand_path('../env', __FILE__)
env = (ENV['RACK_ENV'] || :development)

module API
end

Dir["#{File.dirname(__FILE__)}/models/**/*.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/app/**/*.rb"].each {|f| require f}

ApplicationServer = Rack::Builder.new {
  if ['production', 'staging'].include? env
    use Rack::SslEnforcer
  end
}
