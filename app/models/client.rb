class Client < ApplicationRecord
  has_many :projects

  def as_json options = {}
    super(options)
  end
end
