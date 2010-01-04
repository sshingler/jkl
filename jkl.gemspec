Gem::Specification.new do |s|
  s.name = %q{jakal}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['sshingler']
  s.date = %q{2010-01-04}
  s.description = %q{Jakal is a Ruby library which contains some utilities for connecting to internet based APIs.}
  s.email = %q{'shingler@gmail.com'}
  
  s.extra_rdoc_files = ["README.md", "License.txt"]
  
  s.files = ["lib/jkl.rb",
            "lib/jkl/calais_client.rb",
            "lib/jkl/rest_client.rb", 
            "lib/jkl/rss_client.rb",  
            "lib/jkl/text_client.rb",
            "features/calais.feature",
            "features/http.feature",
            "features/sanitize-text.feature",
            "features/mocks/bbc_story.html",
            "features/mocks/calais.json",
            "features/mocks/topix_rss.xml",
            "features/mocks/twitter.json",
            "features/step_definitions/calais_steps.rb",
            "features/step_definitions/http_steps.rb",
            "features/step_definitions/sanitize-text_steps.rb",
            "features/step_definitions/twitter_steps.rb",
            "features/support/env.rb"
            ]
  #s.test_files = FileList["{test}/**/*test.rb"].to_a
  s.has_rdoc = false
  s.homepage = %q{http://github.com/sshingler/jkl}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  #s.rubyforge_project = %q{grit}
  s.rubygems_version = %q{1.3.4}
  s.summary = s.description

end
