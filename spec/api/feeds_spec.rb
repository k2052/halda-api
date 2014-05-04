describe Halda::Api::Feeds do 
  def account
    @account ||= FactoryGirl.create(:account_with_feed)
  end

	before do 
		header 'Accept', 'application/vnd.halda-v1+json' 
	end

	it "should refuse to return a feed unless logged in" do
		get "/#{account.username}/feed"
		last_response.status.should  == 401
	end

	# it "should return all the links for an account", do
	# 	get "/#{account.username}/feed"
# 
	#   response.content_type.should == 'application/json'
	#   response.status.should       == 200
	#   response_json.should         == account.feed().to_json()
	# end
end
