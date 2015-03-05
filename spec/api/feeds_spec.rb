describe Halda::Api::Feeds do
  def account
    @account ||= FactoryGirl.create(:account_with_feed)
  end

	before do
		header 'Accept', 'application/vnd.halda-v1+json'
	end

  context "unauthorized" do
    it "should refuse to create a feed" do
      post "/feeds"
      last_response.status.should == 401
    end
  end

  context "authorized" do
    before do
      get "/accounts/#{account.username}/set-test-account"
    end

    it "should create a new feed from json feed data" do
      feed = FactoryGirl.build(:feed)

      post "/feeds", feed: feed.serializable_hash
      last_response.status.should == 201

      feed_resp = JSON.parse(last_response.body)
      feed = Feed.find feed_resp['id']
      feed.should_not be_nil
    end
  end
end
