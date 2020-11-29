class Group < ApplicationRecord
  has_many :people
  validates :name, :street, :number, :zip, :town, :country, presence: true
  validates :name, uniqueness: { scope: :street, message: "Familie existiert bereits"}
end
