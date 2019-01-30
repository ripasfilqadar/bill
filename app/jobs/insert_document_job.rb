# :trust: blacklist all user's bank accounts
class InsertDocumentJob
  include Backburner::Queue
  queue 'insert-document-to-db'
  queue_priority 1000

  def self.perform()
    
  end
end