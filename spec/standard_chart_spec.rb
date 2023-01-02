RSpec.describe ImdbChart::StandardChart do

	describe 'initialize' do
		
		context 'not passing in a chart_type' do
			let(:standard_chart) { ImdbChart::StandardChart.new }

			it_behaves_like 'successful chart creation with args', {
				chart: ImdbChart::StandardChart.new,
				expected_chart_type: :top_films,
				expected_url: 'https://www.imdb.com/chart/top',
				expected_contents_size: 250
			}
		end

		context 'passing in a chart_type' do

			context 'passing in nil' do
				it 'should raise an error saying you cannot pass in nil' do
					expect{ ImdbChart::StandardChart.new( nil ) }.to raise_error(
						StandardError, "chart_type cannot be nil"
					)
				end
			end

			context 'passing in a not nil but not valid chart_type' do
				it 'should raise an error saying it is not a valid chart type' do
					expect{ ImdbChart::StandardChart.new( :not_valid ) }.to raise_error(
						StandardError, "chart_type not_valid is not valid"
					)
				end
			end

			context 'passing in :top_films' do
				it_behaves_like 'successful chart creation with args', {
				chart: ImdbChart::StandardChart.new( :top_films ),
				expected_chart_type: :top_films,
				expected_url: 'https://www.imdb.com/chart/top',
				expected_contents_size: 250
			}
			end

			context 'passing in :bottom_films' do
				it_behaves_like 'successful chart creation with args', {
				chart: ImdbChart::StandardChart.new( :bottom_films ),
				expected_chart_type: :bottom_films,
				expected_url: 'https://www.imdb.com/chart/bottom',
				expected_contents_size: 100
			}
			end

			context 'passing in :top_tv_shows' do
				it_behaves_like 'successful chart creation with args', {
				chart: ImdbChart::StandardChart.new( :top_tv_shows ),
				expected_chart_type: :top_tv_shows,
				expected_url: 'https://www.imdb.com/chart/toptv',
				expected_contents_size: 250
			}
			end

		end
	end

end