# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jkl}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['steven shingler', 'richard vaughan']
  s.date = %q{2009-08-27}
  s.description = %q{Jkl is a Ruby library for dealing with information overload.}
  s.email = %q{'shingler@gmail.com'}
  
  s.extra_rdoc_files = ["README.rdoc", "License.txt"]
  
  s.files = ["lib/jkl.rb",
            "lib/jkl/calais_client.rb",
            "lib/jkl/persistence_client.rb", 
            "lib/jkl/rest_client.rb", 
            "lib/jkl/rss_client.rb", 
            "lib/jkl/url_doc_handler.rb",
            "features/calais.feature",
            "features/homepage.feature",
            "features/http.feature",
            "features/persistence.feature",
            "features/processing.feature",
            "features/sanitize-text.feature",
            "features/twitter.feature",
            "features/mocks/bbc_story.html",
            "features/mocks/calais.json",
            "features/mocks/topix_rss.xml",
            "features/mocks/twitter.json",
            "features/step_definitions/calais_steps.rb",
            "features/step_definitions/home_page_steps.rb",
            "features/step_definitions/http_steps.rb",
            "features/step_definitions/persistence_steps.rb",
            "features/step_definitions/processing_steps.rb",
            "features/step_definitions/require_steps.rb",
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
  s.add_dependency("leenookx-json-mangler", ">=0.2.6")
  s.add_dependency("leenookx-calais-utils", ">=0.0.0")

end
