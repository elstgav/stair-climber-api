class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true, presence: true

  has_many :climbs, dependent: :destroy

  class << self
    def with_total_flights(daterange = nil)
      users = joins(:climbs)
      users = users.where(climbs: { datetime: daterange }) if daterange.present?

      users
        .select('users.*, sum(climbs.flights) as total_flights')
        .group(:user_id)
    end
  end
end
