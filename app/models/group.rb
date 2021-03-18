class Group < ApplicationRecord
  has_many :people, dependent: :destroy
  validates :name, :street, :number, :zip, :town, :country, presence: true
  validates :name, uniqueness: { scope: :street, message: "Familie existiert bereits"}

  after_create_commit { broadcast_prepend_to "groups"}
end
