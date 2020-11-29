class Person < ApplicationRecord
  has_and_belongs_to_many :camps
  belongs_to :room, optional: true
  belongs_to :group
  validates :firstname, presence: true
end
