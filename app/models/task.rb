class Task < ApplicationRecord
  belongs_to :project

  as_enum :status, %i{ to_do doing done }
end
