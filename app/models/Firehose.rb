class Firehose
	include MongoMapper::Document

  belongs_to :account
end
