class Doc < ActiveRecord::Base
  serialize :fields, Hash # AH: temp implementation for coded info
  belongs_to :team
  belongs_to :last_touched_admin, :class_name => 'User'
  belongs_to :last_touched_supervisor, :class_name => 'User'
  belongs_to :last_touched_coder, :class_name => 'User'

  validates_uniqueness_of :case_key, :scope => :team_id

  belongs_to :team

  # AH: Demo for Steven only
  VALID_CASE_KEYS_FOR_TESTING = ["madce-131638", "moedce-78417", "cacdce-371468", "txwdce-350743", "azdce-54425", "ksdce-63278", "flsdce-353589", "njdce-176632", "ilndce-127696", "txwdce-8788"] 

  # document statuses
  TODO = 0
  STARTED = 1 # some progress has been made
  WAITING_FOR_ACCEPTANCE = 2 # QA'd by a supervisor
  WAITING_FOR_APPROVAL = 3 # finished
  APPROVED = 4 # accepted by RPX
  
  # document flags
  NO_FLAG = 0
  QUESTION_FOR_SUPERVISOR = 1
  QUESTION_FOR_ADMIN = 2
  WRONG_DOCUMENT = 3
  
  # attr_accessible 
  
  class << self
    def present_for_role user, docs
      # presents a document for display in table according to the user's role
    end
  end
end