class Feed
	include MongoMapper::Document

	belongs_to :account

	def links
		Link.where(feed_id: self.id).sort(:temp.desc).limit(20)
	end
end
