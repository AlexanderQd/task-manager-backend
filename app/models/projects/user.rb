class Projects::User < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :project, required: false
end
