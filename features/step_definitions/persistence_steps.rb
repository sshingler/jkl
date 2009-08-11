
When /^I persist a document$/ do
  pc = PersistenceClient.new(YAML::load_file('config.yml')['testdb'])
  @response = pc.persist({:key => 'value', 'another key' => 'another value'})
  doc = pc.get(@response['id'])
  announce doc.to_s
  pc.destroy
end

#TODO retrieve some stuff from db, delete db, 
#doc = @db.get(tag['name'])
#puts doc
#puts @db.documents.inspect
When /^I parse this response$/ do
  pc = PersistenceClient.new(YAML::load_file('config.yml')['testdb'])
  i = 0
  get_tag_from_json(@json) do |tag| 
    i = i+1 # count number of tags
    @response = pc.persist(tag) 
  end
  #checking the number of persisted docs - minus 1 because we don't persist the doc item
  i.should == JSON.parse(@json).length-1 
  pc.destroy
end