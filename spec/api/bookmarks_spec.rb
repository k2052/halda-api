describe Halda::Api::Bookmarks do
  before do
    header 'Accept', 'application/vnd.halda-v1+json'
  end

  def account
    @account ||= FactoryGirl.create(:account_with_feed)
  end

  context "unauthorized" do
    it "should refuse to create a bookmark" do
      post "/bookmarks"
      last_response.status.should == 401
    end

    it "should refuse to return bookmarks" do
      get "/bookmarks/bob"
      last_response.status.should == 401
    end
  end

  context "authorized" do
    before do
      get "/accounts/#{account.username}/set-test-account"
    end

    describe "valid data" do
      it "should create a new bookmark from json bookmark data" do
        bookmark = FactoryGirl.build(:bookmark)

        post "/bookmarks", bookmark: bookmark.serializable_hash
        last_response.status.should == 201

        bookmark_resp = JSON.parse(last_response.body)
        bookmark = Bookmark.find bookmark_resp['id']
        bookmark.should_not be_nil
      end

      it "should create a new bookmark from link model data" do
        link = FactoryGirl.create(:link)

        post "/bookmarks", link: link.serializable_hash
        last_response.status.should == 201

        bookmark_resp = JSON.parse(last_response.body)
        bookmark = Bookmark.find bookmark_resp['id']
        bookmark.should_not be_nil
      end

      it "should create a new bookmark in a hold" do
        bookmark = FactoryGirl.build(:bookmark)
        hold = FactoryGirl.create(:hold)

        post "/bookmarks", bookmark: bookmark.serializable_hash.merge!(hold_id: hold.id)
        last_response.status.should == 201

        bookmark_resp = JSON.parse(last_response.body)
        bookmark = hold.bookmarks.all(id: bookmark_resp['id'])
        bookmark.should_not be_nil
      end

      it "should retrive a bookmark" do
        bookmark = FactoryGirl.create(:bookmark)

        get "/bookmarks/#{bookmark.id}"
        last_response.status.should == 200

        bookmark_resp = JSON.parse(last_response.body)
        bookmark.id.to_s.should == bookmark_resp['id']
      end
    end

    context "invalid data" do
      it "should fail to create a new bookmark when using invalid data" do
        bookmark = FactoryGirl.build(:bookmark_invalid)

        post "/bookmarks", bookmark: bookmark.serializable_hash
        last_response.status.should == 400
      end

      it "should return 404 when a bookmark does not exist" do
        get "/bookmarks/cats"
        last_response.status.should == 404
      end
    end
  end
end
