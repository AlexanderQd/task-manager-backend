class Task < ApplicationRecord
  belongs_to :project, required: false
  has_many :tasks_registers, class_name: '::Tasks::Register'

  accepts_nested_attributes_for :tasks_registers

  as_enum :status, %i{ to_do doing done }

  def as_json options = {}
    super(options)
  end

  def tasks_registers_attributes= attr = {}
    tasks_registers.build(attr)
  end
end
