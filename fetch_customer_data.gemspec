# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fetch_customer_data/version'

Gem::Specification.new do |spec|
  spec.name          = "fetch_customer_data"
  spec.version       = FetchCustomerData::VERSION
  spec.authors       = ["manishaharidas"]
  spec.email         = ["manishaharidas10@gmail.com"]

  spec.summary       = %q{Consumes data from the collection to display it}
  spec.description   = %q{Consumes data from the collection and can be used independently on irb}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = ""
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = ["lib/fetch_customer_data.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
