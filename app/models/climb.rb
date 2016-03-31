class Climb < ActiveRecord::Base
  belongs_to :user

  class << self
    def user_flights(user_id, date_range = nil)
      users = where(user_id: user_id)
      users = users.where(datetime: date_range) if date_range.present?
      users
    end
  end
end
