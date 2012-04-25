class Team < ActiveRecord::Base
  has_many :users
  has_many :supervisors, :class_name => 'User', :conditions => ['role = ?', User::SUPERVISOR]
  has_many :coders, :class_name => 'User', :conditions => ['role = ?', User::CODER]
  
  has_many :docs
  has_many :approved_docs, :class_name => 'Doc', :conditions => ['status = ?', Doc::APPROVED]
  has_many :unfinished_docs, :class_name => 'Doc', :conditions => ['status = ? or status = ?', Doc::STARTED, Doc::TODO]
  has_many :docs_waiting_acceptance, :class_name => 'Doc', :conditions => ['status = ?', Doc::WAITING_FOR_ACCEPTANCE]
  has_many :docs_waiting_approval, :class_name => 'Doc', :conditions => ['status = ?', Doc::WAITING_FOR_APPROVAL]
  has_many :docs_not_started, :class_name => 'Doc', :conditions => ['status = ?', Doc::TODO]
  has_many :docs_with_supervisor_question, :class_name => 'Doc', :conditions => ['flag = ?', Doc::QUESTION_FOR_SUPERVISOR]
  has_many :docs_with_admin_question, :class_name => 'Doc', :conditions => ['flag = ?', Doc::QUESTION_FOR_ADMIN]
  has_many :docs_with_wrong_pdf, :class_name => 'Doc', :conditions => ['flag = ?', Doc::WRONG_DOCUMENT]
  
  validates_presence_of :name
  
  def add_docs_from_comma_seperated string_of_keys
    # REAL IMPLEMENTATION FOR DOCUMENT RETRIEVAL SHALL GO HERE
    return false if string_of_keys.blank?
    case_keys = string_of_keys.split(',')
    successes, failures = [], []
    case_keys.each do |case_key|        
      if Doc::VALID_CASE_KEYS_FOR_TESTING.include?(case_key)
        if Doc.create(:case_key => case_key, :docket_number => '04-025N' , :document_number => 500+rand(10000), :team => self)
          successes << case_key
        end
      else
        failures << case_key
      end
    end
    return results_messages(successes, failures)
  end
    
  def results_messages successes, failures
    success_message = successes.present? ? "Successfully put documents into #{name}'s queue for cases: #{successes.join(', ')}" : nil
    failure_message = failures.present? ? "Failed to create documents for cases: #{failures.join(', ')}" : nil
    return success_message, failure_message
  end
end