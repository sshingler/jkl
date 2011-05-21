Gem::Specification.new do |s|
  s.name = %q{jakal}
  s.version = "0.1.96"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['sshingler']
  s.date = %q{2010-04-13}
  s.description = %q{Jakal is a Ruby library which contains some utilities for tagging content, cleaning text from web pages and working with RSS feeds.}
  s.email = %q{'shingler@gmail.com'}
  
  s.extra_rdoc_files = ["README.md", "License.txt"]
  
  s.files = ["lib/jkl.rb",
            "lib/jkl/calais_client.rb",
            "lib/jkl/rest_client.rb", 
            "lib/jkl/rss_client.rb",  
            "lib/jkl/text_client.rb",
            "test/fixtures/bbc_story.html",
            "test/fixtures/topix_rss.xml",
            "test/unit/jkl_test.rb",
            "test/unit/text_cleaning_test.rb",
            "config/config.yml"
            ]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/sshingler/jkl}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = s.description
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.2"])
      s.add_runtime_dependency(%q<json>, [">= 1.2.4"])
      s.add_runtime_dependency(%q<rest-client>, [">= 1.4.2"])
      s.add_runtime_dependency(%q<calais>, [">= 0.0.9"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.8.2"])
      s.add_dependency(%q<json>, [">= 1.2.4"])
      s.add_dependency(%q<rest-client>, [">= 1.4.2"])
      s.add_dependency(%q<calais>, [">= 0.0.9"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.8.2"])
    s.add_dependency(%q<json>, [">= 1.2.4"])
    s.add_dependency(%q<rest-client>, [">= 1.4.2"])
    s.add_dependency(%q<calais>, [">= 0.0.9"])
  end
end
