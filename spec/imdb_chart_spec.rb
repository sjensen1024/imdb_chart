RSpec.describe ImdbChart do
  it "has a version number" do
    expect(ImdbChart::VERSION).not_to be nil
  end

  context 'BASE_URL' do
  	it 'should be the correct IMDB chart URL' do
  		expect( ImdbChart::BASE_URL ).to eq( 'https://www.imdb.com/chart/' )
  	end
  end

  context 'TD_CSS_NAME' do
  	it 'should be the correct td css name' do
  		expect( ImdbChart::TD_CSS_NAME ).to eq( 'td.titleColumn' )
  	end
  end

  context 'CHART_TYPE_ATTRIBUTES' do
  	it 'should be the correct chart types' do
  		expect( ImdbChart::CHART_TYPE_ATTRIBUTES ).to eq(
  			[
				{
					type: :top_films,
					path_relative_to_base_url: "top"
				},
				{
					type: :bottom_films,
					path_relative_to_base_url: "bottom"
				},
				{
					type: :top_tv_shows,
					path_relative_to_base_url: "toptv"
				}
			]
  		)
  	end
  end

end
