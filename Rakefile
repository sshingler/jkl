require 'rubygems'
require 'spec/rake/spectask'
require 'cucumber/rake/task'
require 'sinatra'
require 'ftools'

#task :default => [:features, :deploy]

#task features
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty"
  #t.feature_list = FileList['functionaltests/features/use/**/*.feature']
end

task :deploy do
  system("cap deploy:push_staging")
end