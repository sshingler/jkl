require 'couchrest'
require 'rbconfig'

module Jkl
  
  SERVER = CouchRest.new
  SERVER.default_database = 'couchrest-extendeddoc-example'
  
  class PersistenceClient
  
    def initialize(db)
      @db = CouchRest.database!(db)
    end
    
    def persist(json)
      @db.save_doc(json)
    end
    
    def get(id)
      @db.get(id)
    end

    def destroy
      @db.delete! rescue nil
    end

  end
  
  class Trend < CouchRest::ExtendedDocument
    
    use_database SERVER.default_database
    property :name
    timestamps!
    
  end
  
end