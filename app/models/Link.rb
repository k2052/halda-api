class Link
	include MongoMapper::Document
  
	##
	# Keys
	## 
	key 'raw_url',       String # url with protocol and shit. as it was added to app
	key 'url',           String
	key "comment",       String
	key 'title',         String
	key 'type',          String 
	key 'hasMeta',       Boolean
	key 'images',        Array
	key 'image_widths',  Array
	key 'image_heights', Array
	key 'type',          String, default: "feeditem"

	# belongs_to :collection
	# belongs_to :feed

	def inCollection?
		!collection_id.blank?
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
end
