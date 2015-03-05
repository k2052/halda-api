require "Feed"
require "Hold"
require "Link"

##
# TODO Make This inherit from Link
#
class Bookmark
  include MongoMapper::Document
  set_collection_name "bookmarks"

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
  key 'type',          String, default: "bookmark"

  belongs_to :account
  belongs_to :feed
  belongs_to :hold

  validates_presence_of :url

  def inHold?
    !hold_id.blank?
  end

  def self.create_from_link link
    create! do |bookmark|
      attrs = link.serializable_hash
      attrs.delete(:id)
      bookmark.update_attributes attrs
    end
  end
end
