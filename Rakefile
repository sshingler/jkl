require 'rubygems'
require 'rake/testtask'

desc "Run all the tests"
Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/unit/*.rb']
    t.verbose = true
end