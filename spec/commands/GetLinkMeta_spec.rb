describe GetLinkMeta do
	it "should go and extract meta data from a url" do
		link = Link.create url: "https://github.com/ryggrad/Ryggrad"
		VCR.use_cassette(:links, :decode_compressed_response => true) do
			link.images.should be_empty
			command = GetLinkMeta.new link_id: link.id, url: link.url
			command.perform().should be_true
			link.reload()
			link.images.first.should == "https://avatars1.githubusercontent.com/u/5703900?s=400"
		end
	end
end
