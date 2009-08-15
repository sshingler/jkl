require 'couchrest'
require 'rbconfig'

module Jkl
  
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
  
end