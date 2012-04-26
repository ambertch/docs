# this should transform a doc to be displayable in the table view (like Status from ID to english)
class DocTablePresenter
  class << self
    def present docs
      table_docs = []
      docs.each{ |doc| table_docs << transform(doc) }
      return table_docs
    end
    
    def transform doc
      table_doc = OpenStruct.new({
        :id => doc.id,
        :case_key => doc.case_key,
        :docket_number => doc.docket_number,
        :document_number => doc.document_number,
        :status => make_status(doc.status),
        :locked_by => doc.locked_by_user ? doc.locked_by_user.name : "",
        :last_coder => doc.last_touched_coder ? doc.last_touched_coder.name : "",
        :last_update_type => make_last_update_type(doc),
        :last_update_time => make_last_update_time(doc)        
      })
      return table_doc
    end
    
    def make_status status
      case status
      when Doc::TODO
        "To Do"
      when Doc::IN_PROGRESS
        "Started"
      when Doc::WAITING_FOR_ACCEPTANCE
        "Finished"
      when Doc::WAITING_FOR_APPROVAL
        "Accepted"      
      when Doc::APPROVED
        "Approved"
      end
    end

    def make_last_update_type doc
      "this is status? eh?"
    end
    
    def make_last_update_time doc
      doc.updated_at      
    end
  end
end