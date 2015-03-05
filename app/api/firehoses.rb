module Halda
	module Api
		class Firehoses < Grape::API
		  version 'v1', using: :header, vendor: 'halda'
		  format :json

		  before do
		  	authenticated?
		  end

			get "/:account/firehose" do
				{
					feed: current_account.feed().serializable_hash(),
					links: current_account.feed().links().serializable_hash()
				}.to_json
			end
		end
	end
end
