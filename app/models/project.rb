class Project < ApplicationRecord
  belongs_to :client
  has_many :projects_users, class_name: '::Projects::User'
  has_many :users, through: :projects_users

end
