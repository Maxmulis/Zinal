class Group < ApplicationRecord
  has_many :people, dependent: :destroy
  validates :name, :street, :number, :zip, :town, :country, presence: true
  validates :name, uniqueness: { scope: :street, message: "Familie existiert bereits" }
end
