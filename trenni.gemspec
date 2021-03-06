
require_relative "lib/trenni/version"

Gem::Specification.new do |spec|
	spec.name = "trenni"
	spec.version = Trenni::VERSION
	
	spec.summary = "A fast native templating system that compiles directly to Ruby code."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.homepage = "https://github.com/ioquatix/trenni"
	
	spec.metadata = {
		"funding_uri" => "https://github.com/sponsors/ioquatix",
	}
	
	spec.files = Dir.glob('{bake,ext,lib,parsers,spec}/**/*', File::FNM_DOTMATCH, base: __dir__)
	
	spec.extensions = ["ext/Rakefile"]

	spec.required_ruby_version = ">= 2.5"
	
	spec.add_dependency "rake-compiler"
	
	spec.add_development_dependency "bake-bundler"
	spec.add_development_dependency "bake-modernize"
	spec.add_development_dependency "bundler"
	spec.add_development_dependency "covered"
	spec.add_development_dependency "rspec", "~> 3.4"
end
