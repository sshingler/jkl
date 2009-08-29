require 'couchrest'

module Jkl
  
  SERVER = CouchRest.database! YAML::load_file('config/config.yml')['db']
  
  def delete_db
    SERVER.delete! rescue nil
  end
  
  class Trend < CouchRest::ExtendedDocument
    
    use_database SERVER
    property :name
    view_by :name
    timestamps!
  
  end
  
end