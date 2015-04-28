# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "r_hapi"
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Stephenson of RaddOnline"]
  s.date = "2015-04-28"
  s.description = "Makes it easy to use the HubSpot API in a Ruby application."
  s.email = "tim@raddonline.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/r_hapi.rb",
    "lib/r_hapi/configuration.rb",
    "lib/r_hapi/connection.rb",
    "lib/r_hapi/contact.rb",
    "lib/r_hapi/lead.rb",
    "lib/r_hapi/r_hapi_exception.rb",
    "r_hapi.gemspec",
    "spec/config.yml.sample",
    "spec/configuration_spec.rb",
    "spec/fixtures/error.html",
    "spec/fixtures/lead.json",
    "spec/fixtures/leads.json",
    "spec/lead_spec.rb",
    "spec/r_hapi_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/timstephenson/rHAPI"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "A ruby wrapper for the HubSpot API (HAPI)."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<curb>, ["~> 0.8.8"])
      s.add_runtime_dependency(%q<json>, [">= 1.5.1"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<curb>, ["~> 0.7.12"])
      s.add_runtime_dependency(%q<json>, [">= 1.5.1"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
    else
      s.add_dependency(%q<curb>, ["~> 0.8.8"])
      s.add_dependency(%q<json>, [">= 1.5.1"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.5.0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<curb>, ["~> 0.7.12"])
      s.add_dependency(%q<json>, [">= 1.5.1"])
      s.add_dependency(%q<activesupport>, [">= 0"])
    end
  else
    s.add_dependency(%q<curb>, ["~> 0.8.8"])
    s.add_dependency(%q<json>, [">= 1.5.1"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.5.0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<curb>, ["~> 0.7.12"])
    s.add_dependency(%q<json>, [">= 1.5.1"])
    s.add_dependency(%q<activesupport>, [">= 0"])
  end
end

