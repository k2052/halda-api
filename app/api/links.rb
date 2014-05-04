module Halda
	module Api
		class Links < Grape::API
		  version 'v1', using: :header, vendor: 'halda'
		  format :json
		end
	end
end
