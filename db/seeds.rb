if Rails.env != 'test'
  DEV_USERS=[
    ["Steven Duplinsky", "steven@gmail.com", User::CODER],
    ["Amit Raj", "coder1@coder.com", User::CODER],
    ["Jain Neha", "coder2@coder.com", User::CODER],
    
    ["Yao Ming", "yao@gmail.com", User::SUPERVISOR],
    ["Jagdeep Singh", "jagdeepinator@juno.com", User::SUPERVISOR],
    ["Marshall Mathers", "eminem@gmail.com", User::SUPERVISOR],
    
    
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
  
  User.find_by_email("steven@gmail.com").update_attributes(:team_id => china.id)

  User.find_by_email("jagdeepinator@juno.com").update_attributes(:team_id => bangalore.id)
  User.find_by_email("coder1@coder.com").update_attributes(:team_id => bangalore.id)
  User.find_by_email("coder2@coder.com").update_attributes(:team_id => bangalore.id)
  
  User.find_by_email("eminem@gmail.com").update_attributes(:team_id => china.id)
  User.find_by_email("yao@gmail.com").update_attributes(:team_id => china.id)

  china.add_docs_from_comma_seperated('madce-131638,moedce-78417,cacdce-371468')
  bangalore.add_docs_from_comma_seperated('ksdce-63278,flsdce-353589,njdce-176632,ilndce-127696,txwdce-8788')

  
end
