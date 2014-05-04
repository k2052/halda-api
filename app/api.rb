module Halda
  class API < Grape::API
    version 'v1', using: :header, vendor: 'tribute', strict: false
    format :json

    helpers Halda::Helpers::Auth

    mount Halda::Api::Auth
    mount Halda::Api::Feeds
    mount Halda::Api::Links
  end
end

