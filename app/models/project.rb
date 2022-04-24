class Project < ApplicationRecord
  belongs_to :client, required: false
  has_many :projects_users, class_name: '::Projects::User'
  has_many :users, through: :projects_users

  def as_json options = {}
    super(options)
  end
end
