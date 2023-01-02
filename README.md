# ImdbChart

This is a made-for-fun gem that will get information provided in standard IMDB charts (currently just Top 250 films, Bottom 100 films, and Top 250 TV shows). Please be advised that this uses web scraping and could stop working if the IMDB site design were to change.

## Usage

- Create a new instance of `ImdbChart::StandardChart` with an optional chart-type parameter of `:top_films`, `:bottom_films`, or `top_tv_shows`. It defaults to `:top_films`.
- The resulting instance of `ImdbChart::StandardChart` will contain the following attributes:
  - **chart_type**: the chart type
  - **contents**: an array of hashes containing the results on the page (keys are ranking, title, and year)
  - **imdb_url**: URL of the page from which we got the results
  - **retrieval_time**: `DateTime` of when the contents were retrieved
- Example: `ImdbChart::StandardChart.new( :top_films )`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/imdb_chart. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/imdb_chart/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ImdbChart project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/imdb_chart/blob/master/CODE_OF_CONDUCT.md).
