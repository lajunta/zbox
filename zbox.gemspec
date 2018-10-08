# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "zbox/version"

Gem::Specification.new do |s|
  s.name        = "zbox"
  s.version     = Zbox::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["zxy"]
  s.email       = ["zxy@qq.com"]
  s.homepage    = "http://lajunta.qq.com/"
  s.summary     = %q{zxy's ruby toolbox'}
  s.description = %q{zxy's ruby tool collections'}
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE",  "README.md"]

  s.add_runtime_dependency 'quick_magick', '~> 0'
end
