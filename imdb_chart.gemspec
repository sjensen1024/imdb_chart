require_relative 'lib/imdb_chart/version'

Gem::Specification.new do |spec|
  spec.name          = "imdb_chart"
  spec.version       = ImdbChart::VERSION
  spec.authors       = ["Steve Jensen"]
  spec.email         = ["stevenmjensen1024@gmail.com"]

  spec.summary       = "A gem that allows you to read charts on IMDB (top 250, bottom 100, etc.)"
  spec.homepage      = "https://github.com/sjensen1024/imdb_chart"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/imdb_chart"]

  spec.add_dependency "httparty", "~> 0.18", ">= 0.18.0"
  spec.add_dependency "activesupport", "~> 6.1", ">= 6.1.0"
  spec.add_dependency "nokogiri", "~> 1.10", ">= 1.10.9"
end
