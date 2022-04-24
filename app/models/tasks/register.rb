class Tasks::Register < ApplicationRecord
  belongs_to :task, required: false
  belongs_to :user, required: false

  def as_json options = {}
    super(options)
  end

end
