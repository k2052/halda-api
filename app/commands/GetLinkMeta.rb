class GetLinkMeta < CommandWithErrors
	@queue = :scraping

  attribute :link_id
  attribute :url

  def action
  	link_id = @options[:link_id]
  	url     = @options[:url]

  	link = Link.find link_id
  	link_with_meta = Link.first url: url, hasMeta: true

  	if link_with_meta
  		link.add_meta_from_another_link link
  		if link.save()
				completed()
				return true
			else
				failed()
				return false
			end
  	else
	    begin
	      if meta = MetaInspector.new(link.url, :allow_redirections => :safe)
	  	  	link.add_meta meta
		  		if link.save()
						completed()
						return true
					else
						failed()
						return false
					end
				else
	      end
	    rescue Exception => e
	    	puts e.inspect
	      failed()
	      return false
	    end
	  end
  end
end
