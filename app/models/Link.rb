require "Feed"

class Link
	include MongoMapper::Document

	##
	# Keys
	##
	key 'url',           String
	key "comment",       String
	key 'title',         String
	key 'hasMeta',       Boolean
	key 'images',        Array
	key 'image_widths',  Array
	key 'image_heights', Array
	key 'type',          String, default: "rssitem"

	belongs_to :feed
	after_create :getLinkMetaData

	validates_presence_of :url

	def self.create_from_rss_entry entry
    create! do |link|
			link.url     = entry.link
			link.title   = entry.title
			link.comment = entry.description
		end
	end

	def full_url
		"https://#{self.url}"
	end

	def add_meta_from_another_link link
		self.images        = link.images
		self.image_widths  = link.image_widths
		self.image_heights = link.image_heights

		self.hasMeta = true
	end

	def add_meta meta
		self.images        = meta.meta_tags['property']['og:image']
		self.image_widths  = meta.meta_tags['property']['og:image:width']
		self.image_heights = meta.meta_tags['property']['og:image:heights']
		self.hasMeta = true
	end

	def makeHotter(inc=1)
		self.temp = self.temp + inc
	end

	def getLinkMetaData
		GetLinkMeta.create url: self.url, link_id: self.id unless Halda.env == :test
	end
end
