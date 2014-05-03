describe Link do 
	it 'should create a new instance' do
    link = Link.create()
    link = Link.find link.id
    link.should_not be_nil
  end
end
