require "imdb_chart/version"
require "imdb_chart/standard_chart"

module ImdbChart
		
	BASE_URL = 'https://www.imdb.com/chart/'
	TD_CSS_NAME = 'td.titleColumn'
	CHART_TYPE_ATTRIBUTES = [
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

end
