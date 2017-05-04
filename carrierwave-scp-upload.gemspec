$:.push File.expand_path("../lib", __FILE__)

require "carrierwave-scp-upload/version"

Gem::Specification.new do |s|
  s.name        = "carrierwave-scp-upload"
  s.version     = CarrierwaveScp::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Yen-Thanh Le"]
  s.email       = ["abc@lythanh.xyz"]
  s.homepage    = "https://github.com/yenthanh132/carrierwave-scp-upload"
  s.summary     = "SCP storage for CarrierWave."
  s.description = "Custom uploader for CarrierWave lib using SCP method"

  s.rubyforge_project = "carrierwave-scp-upload"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec}/*`.split("\n")

  s.add_dependency "carrierwave"
  s.add_dependency "net-scp"

  s.add_development_dependency "rspec"
end
