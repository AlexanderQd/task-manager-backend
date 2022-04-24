class User < ApplicationRecord
  has_secure_password

  has_many :projects_users, class_name: '::Projects::User'
  has_many :projects, through: :projects_users
  has_many :registers

  scope :active, ->  { where(active: true) }

  def as_json options = {}
    super(options)
  end

  def self.current
    RequestStore.store[:user]
  end

  def self.current= user
    RequestStore.store[:user] = user
  end
end
