class Person < ApplicationRecord
  has_and_belongs_to_many :camps
  belongs_to :room, optional: true
  belongs_to :group
  validates :firstname, presence: true
  has_one_attached :photo

  def age
    now = Date.today
    dob = birthdate
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def adult?
    age >= 18
  end

  def kid?
    age < 18
  end

end
