describe ParseFeed do
  it "should go and parse a feed" do
    feed = Feed.create url: "https://github.com/k2052.atom"
    VCR.use_cassette(:feeds, :decode_compressed_response => true) do
      feed.last_parsed_at.should be_nil
      command =  ParseFeed.new feed_id: feed.id, url: feed.url
      command.perform().should be_true
      feed.last_parsed_at.should be_nil
      feed.reload()
      feed.last_parsed_at.should_not be_nil
    end
  end
end
