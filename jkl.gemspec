Gem::Specification.new do |s|
  s.name = %q{jakal}
  s.version = "0.2.0"
  s.platform = Gem::Platform::RUBY
  s.authors = ['sshingler']
  s.homepage = %q{http://github.com/sshingler/jkl}
  s.description = %q{Jakal is a Ruby library for tagging keywords from web pages.}
  s.summary = s.description
  s.email = %q{'shingler@gmail.com'}
  
  s.require_paths = ["lib"]
  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.add_dependency(%q<rake>, [">= 0.8.7"])
  s.add_dependency(%q<mechanize>, [">= 1.0.0"])
  s.add_dependency(%q<nokogiri>, ["~> 1.4.4"])
  s.add_dependency(%q<term-extract>, ["~> 0.5.1"])
end
