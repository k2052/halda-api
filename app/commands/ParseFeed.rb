class ParseFeed < CommandWithErrors
	@queue = :parsing

  attribute :feed_id
  attribute :url

	def action
		feed = Feed.find @options[:feed_id]
		rss  = SimpleRSS.parse open(@options[:url])

		rss.entries.each do |entry|
		  if link = Link.find_by_url(entry.link)
		  	unless link.feed_id == feed_id
		  		link.makeHotter()
		  	end
			else
				Link.create_from_rss_entry entry
		  end
		end

		feed.update_attributes! last_parsed_at: Time.now
	end
end
