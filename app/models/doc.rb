class Doc < ActiveRecord::Base
  serialize :fields, Hash # AH: temp implementation for coded info
  belongs_to :team
  belongs_to :locked_by_user, :class_name => 'User'
  belongs_to :last_coder, :class_name => 'User'
  belongs_to :last_touched_admin, :class_name => 'User'
  belongs_to :last_touched_supervisor, :class_name => 'User'
  belongs_to :last_touched_coder, :class_name => 'User'

  validates_uniqueness_of :case_key, :scope => :team_id

  belongs_to :team

  # AH: Demo for Steven only
  VALID_CASE_KEYS_FOR_TESTING = ["madce-131638", "moedce-78417", "cacdce-371468", "txwdce-350743", "azdce-54425", "ksdce-63278", "flsdce-353589", "njdce-176632", "ilndce-127696", "txwdce-8788"] 

  # document statuses
  TODO = 0
  IN_PROGRESS = 1 # it's been claimed, editted, some progress has been made, or rejected by supervisor
  WAITING_FOR_ACCEPTANCE = 2 # finished by coder
  WAITING_FOR_APPROVAL = 3 # accepted by a supervisor, or rejected by admin
  APPROVED = 4 # approved by admin
  
  # document flags
  NO_FLAG = 0
  QUESTION_FOR_SUPERVISOR = 1
  QUESTION_FOR_ADMIN = 2
  WRONG_DOCUMENT = 3
  
  # attr_accessible 
    
  def touch_it user
    self.last_touched_admin_id = user.id if user.is_admin?
    self.last_touched_supervisor_id = user.id if user.is_supervisor?
    self.last_touched_coder_id = user.id if user.is_coder?
    save
  end
  
  def lock user
    self.locked_by_user = user
    self.last_touched_coder = user if user.is_coder?
    save!
  end
  
  def unlock
    self.locked_by_user = nil
    save
  end
end