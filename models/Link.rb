class Link
	include MongoMapper::Document

	key 'raw_url',       String
	key 'url',           String
	key "comment",       String
  key 'title',         String
	key 'type',          String 
  key 'images',        Array
  key 'image_widths',  Array
  key 'image_heights', Array

	# belongs_to :collection
	# belongs_to :feed

	def inCollection?
		!collection_id.blank?
	end
end
