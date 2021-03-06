class Ask < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :objective
  belongs_to :actor
  has_and_belongs_to_many :activities
end
