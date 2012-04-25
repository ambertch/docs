class User < ActiveRecord::Base
  include User::Roles

  belongs_to :team

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :team_id, :role

  validates_presence_of :name, :email
end
