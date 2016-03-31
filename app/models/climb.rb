class Climb < ActiveRecord::Base
  validates :user_id, numericality: { only_integer: true, greater_than: 0 }
  validates :flights, numericality: { only_integer: true, greater_than: 0 }
  validates_datetime :datetime, on_or_before: :now

  belongs_to :user

  class << self
    def user_flights(user_id, date_range = nil)
      users = where(user_id: user_id)
      users = users.where(datetime: date_range) if date_range.present?
      users
    end
  end
end
