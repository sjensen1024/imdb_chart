module ImdbChart
	class StandardChart
		
		require "httparty"
		require "nokogiri"
		require "active_support/all"
		
		attr_reader :chart_type, :contents, :imdb_url, :retrieval_time

		def initialize( chart_type = :top_films )
			set_attributes_based_on_chart_type( chart_type ) 
		end

		private

		def set_attributes_based_on_chart_type( chart_type )
			check_for_errors_on_chart_type( chart_type )
			@chart_type = chart_type
			chart_type_attributes = CHART_TYPE_ATTRIBUTES.select{ |i| i[:type] == chart_type }.first
			@imdb_url = BASE_URL + chart_type_attributes[:path_relative_to_base_url]
			@contents = get_contents_from_site_response_html_table_data
			@retrieval_time = DateTime.now
		end

		def check_for_errors_on_chart_type( chart_type )
			raise "chart_type cannot be nil" if chart_type.nil?
			raise "chart_type #{chart_type} is not valid" unless is_valid_chart_type?( chart_type )
		end

		def is_valid_chart_type?( chart_type )
			CHART_TYPE_ATTRIBUTES.any?{ |i| i[:type] == chart_type }
		end

		def get_contents_from_site_response_html_table_data
			site_response_html_table_data.collect{ |row| convert_table_data_row_to_chart_content(row) }
		end

		def site_response_html_table_data
			site_response = HTTParty.get( @imdb_url )
			site_response_html = Nokogiri::HTML.parse( site_response.body )
			site_response_html.css( TD_CSS_NAME )
		end

		def convert_table_data_row_to_chart_content(table_data_row)
			row_info = table_data_row.text.split("\n").select{ |i| i.present? }
			{
				rank: row_info.first.strip.gsub(/[^0-9]/, '').to_i,
				title: row_info.second.strip,
				year: row_info.third.strip.gsub(/[^0-9]/, '').to_i
			}
		end
	end
end