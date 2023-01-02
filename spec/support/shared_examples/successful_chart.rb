RSpec.shared_examples 'successful chart creation with args' do |args|
	
	it 'should set the chart_type' do
		expect( args[:chart].chart_type ).to eq( args[:expected_chart_type] )
	end

	it 'should set the imdb_url' do
		expect( args[:chart].imdb_url ).to eq( args[:expected_url] )
	end

	it 'should set the contents to an array of a certain size' do
		expect( args[:chart].contents.is_a?(Array) ).to be( true )
		expect( args[:chart].contents.size ).to eq( args[:expected_contents_size] )	
	end

	it 'should set the rank, title, and year for each piece of contents' do
		expect( 
			args[:chart].contents.all? do |content| 
				content[:rank] > 0 && content[:title].present? && content[:year] > 0
			end 
		).to be( true )
	end

	it 'should set the retrieval_date' do
		expect( args[:chart].retrieval_time ).not_to be_nil
	end
end