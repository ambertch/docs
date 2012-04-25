if Rails.env != 'test'
  DEV_USERS=[
    ["Amit Raj", "coder1@coder.com", User::CODER],
    ["Jain Nehana", "coder2@coder.com", User::CODER],
    ["Steven Duplinsky", "steven@gmail.com", User::CODER],

    ["Jagdeep Singh", "jagdeepinator@juno.com", User::SUPERVISOR],
    ["Marshall Mathers", "eminem@gmail.com", User::SUPERVISOR],
    ["Yao Ming", "yao@gmail.com", User::SUPERVISOR],
    
    ["Eric", "Eric@rpxcorp.com", User::ADMIN]
  ]

  ActiveRecord::Base.transaction do
    DEV_USERS.each do |user_data|
      name, email, role, password = user_data
      User.add(name, email, role, password)
    end
  end

  china = Team.create(:name => "China")  
  bangalore = Team.create(:name => "Bangalore")
  
  User.find_by_email("coder3@coder.com").update_attributes(:team_id => china.id)

  User.find_by_email("jagdeepinator@juno.com").update_attributes(:team_id => bangalore.id)
  User.find_by_email("coder1@coder.com").update_attributes(:team_id => bangalore.id)
  User.find_by_email("coder2@coder.com").update_attributes(:team_id => bangalore.id)
  
  User.find_by_email("eminem@gmail.com").update_attributes(:team_id => china.id)
  User.find_by_email("yao@gmail.com").update_attributes(:team_id => china.id)



  # Doc.create(:case_key => 'madce-131638')
  # Doc.create(:case_key => 'moedce-78417')
  # Doc.create(:case_key => 'cacdce-371468')
  # Doc.create(:case_key => 'txwdce-350743')
  # Doc.create(:case_key => 'azdce-54425')
  # Doc.create(:case_key => 'ksdce-63278')
  # Doc.create(:case_key => 'flsdce-353589')
  # Doc.create(:case_key => 'njdce-176632')
  # Doc.create(:case_key => 'ilndce-127696')
  # Doc.create(:case_key => 'txwdce-8788')
  
end
