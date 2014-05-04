module Halda
	module Api
		class Links < Grape::API
		  version 'v1', using: :header, vendor: 'halda'
		  format :json
		  
		  before do
		  	authenticated?
		  end
		end
	end
end
