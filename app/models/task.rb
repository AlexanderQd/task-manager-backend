class Task < ApplicationRecord
  belongs_to :project, required: false
  has_many :tasks_registers, class_name: '::Tasks::Register'

  as_enum :status, %i{ to_do doing done }

  def as_json options = {}
    super(options)
  end
end
