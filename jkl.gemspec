# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jkl}
  s.version = "0.0.4"

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
            "lib/jkl/url_doc_handler.rb"]
  #s.test_files = FileList["{test}/**/*test.rb"].to_a
  s.has_rdoc = false
  s.homepage = %q{http://github.com/sshingler/jkl}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  #s.rubyforge_project = %q{grit}
  s.rubygems_version = %q{1.3.4}
  s.summary = s.description



end