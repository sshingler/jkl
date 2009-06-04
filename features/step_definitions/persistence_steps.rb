require 'couchrest'

When /^I persist a document$/ do
  @db = CouchRest.database!("http://127.0.0.1:5984/jkl")
  @response = @db.save_doc({:key => 'value', 'another key' => 'another value'})
  doc = @db.get(@response['id'])
  puts @db.documents.inspect
  
end