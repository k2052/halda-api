class Hold
	include MongoMapper::Document

	key :name, String

	##
	# Associations
	#
	belongs_to :account
	has_many :bookmarks
end
