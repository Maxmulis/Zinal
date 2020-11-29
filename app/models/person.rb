class Person < ApplicationRecord
  belongs_to :camp
  belongs_to :room
  belongs_to :group
end
