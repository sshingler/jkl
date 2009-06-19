require 'couchrest'

When /^I persist a document$/ do
  pc = PersistenceClient.new(YAML::load_file('config.yml')['testdb'])
  @response = pc.persist({:key => 'value', 'another key' => 'another value'})
  doc = pc.get(@response['id'])
  announce doc.to_s
  pc.destroy
end