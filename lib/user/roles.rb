# manages role related logic
class User
  module Roles
    extend ActiveSupport::Concern
    
    ADMIN = 1
    SUPERVISOR = 2
    CODER = 3
      
    module InstanceMethods
      def must_have_a_role
        [User::Roles::ADMIN, User::Roles::SUPERVISOR, User::Roles::CODER].include? role
      end
            
      def must_belong_to_a_team_unless_admin
        return true if role == User::Roles::ADMIN
        Team.find_by_id(team_id)
      end 

      def is_admin?
        role == User::Roles::ADMIN
      end
      
      def is_supervisor?
        role == User::Roles::SUPERVISOR
      end
      
      def is_coder?
        role == User::Roles::CODER
      end
    end
    
    module ClassMethods      
      def add(name, email, role, password=nil, team=nil)
        password ||= 'password'
        user = User.create!({:name=>name, :email=>email, :password=>password, :role => role, :team => team})
      end
    end

    included do
      validate :must_have_a_role
      validate :must_belong_to_a_team_unless_admin
    end
  end
end