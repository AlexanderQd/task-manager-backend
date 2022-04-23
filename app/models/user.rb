class User < ApplicationRecord
  has_secure_password

  has_many :projects_users, class_name: '::Projects::User'
  has_many :projects, through: :projects_users
  has_many :registers

  def self.current
    RequestStore.store[:user]
  end

  def self.current= user
    RequestStore.store[:user] = user
  end
end
