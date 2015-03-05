module Halda
  module Api
    class Bookmarks < Grape::API
      version 'v1', using: :header, vendor: 'halda'
      format :json

      before do
        authenticated?
      end

      post '/bookmarks' do
        if params[:link]
          bookmark = Bookmark.create_from_link Link.find params[:link]['id']
          resp(bookmark)
        elsif params[:bookmark]
          bookmark = Bookmark.create params[:bookmark]
          resp(bookmark)
        else
          error!("Invalid Data", 400)
        end
      end

      put "/bookmarks/:id" do
        bookmark = Bookmark.find params[:id]

        bookmark.update_attributes bookmark
        resp(bookmark)
      end

      get '/bookmarks/:id' do
        bookmark = Bookmark.find params[:id]

        return bookmark if bookmark
        error!("Not Found", 404)
      end
    end
  end
end
