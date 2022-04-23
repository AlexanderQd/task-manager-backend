class Register < ApplicationRecord
  belongs_to :task, required: false
  belongs_to :user, required: false

end
