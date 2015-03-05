module Halda
  module Api
    class Feeds < Grape::API
      version 'v1', using: :header, vendor: 'halda'
      format :json

      before do
        authenticated?
      end

      post '/feeds' do
        feed_raw = params[:feed]
        if feed_raw['type'] == 'rss'
          feed = Feed.create feed_raw

          if feed.valid?
            feed
          else
            error!(feed.errors.to_json, 400)
          end
        else
          error!("Feed type not supported. We can only parse RSS feeds", 400)
        end
      end
    end
  end
end
