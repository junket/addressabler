# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: addressabler 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "addressabler"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Flip Sasser"]
  s.date = "2015-01-08"
  s.description = "\n    Addressabler extends the Addressable::URI class to provide information about, and manipulation of, specific parts of URI strings. It adds a `tld' method, a `domain' method,\n    and a `subdomain' method.\n\nIt also allows users to easily modify the URL's query values as a hash.\n  "
  s.email = "flip@x451.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
    "LICENSE",
    "lib/addressabler.rb",
    "lib/addressabler/query.rb",
    "lib/addressabler/uri.rb",
    "lib/addressabler/uri_deprecation.rb",
    "lib/tlds"
  ]
  s.homepage = "http://github.com/flipsasser/addressabler"
  s.rubygems_version = "2.0.3"
  s.summary = "An Addressable::URI extension adding support for TLDs and query part editing"
  s.test_files = ["spec/addressable", "spec/addressable/idna_spec.rb", "spec/addressable/net_http_compat_spec.rb", "spec/addressable/template_spec.rb", "spec/addressable/uri_spec.rb", "spec/addressabler", "spec/addressabler/uri_deprecation_spec.rb", "spec/addressabler/uri_spec.rb", "spec/addressabler_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, [">= 2.3"])
    else
      s.add_dependency(%q<addressable>, [">= 2.3"])
    end
  else
    s.add_dependency(%q<addressable>, [">= 2.3"])
  end
end

