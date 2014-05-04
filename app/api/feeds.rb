module Halda
	module Api
		class Feeds < Grape::API
		  version 'v1', using: :header, vendor: 'halda'
		  format :json

		  before do
		  	authenticated?
		  end

			get ":account/feed" do
				{
					feed: current_account.feed().serializable_hash(),
					links: current_account.feed().links().serializable_hash()
				}.to_json
			end
		end
	end
end
