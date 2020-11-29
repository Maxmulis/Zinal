class Camp < ApplicationRecord
  has_and_belongs_to_many :people
  validates :startdate, :enddate, presence: true
end
