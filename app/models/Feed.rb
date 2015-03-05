class Feed
	include MongoMapper::Document

  ##
  # Keys
  #
	key :type,           String, default: "rss"
	key :url,            String
	key :last_parsed_at, Time

	belongs_to :account

	after_create :parseFeed

	def parseFeed
		ParseFeed.create feed_id: self.id, url: self.url unless Halda.env == :test
	end
end
