class User < ActiveRecord::Base
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, confirmation: true, presence: true
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :home_floor, numericality: { only_integer: true, greater_than: 0 }

  has_many :climbs, dependent: :destroy

  class << self
    def with_total_flights(date_range = nil)
      users = joins('LEFT JOIN climbs ON climbs.user_id = users.id')
      users = users.where(climbs: { datetime: date_range }) if date_range.present?

      users
        .select('users.*, sum(climbs.flights) as total_flights')
        .group('users.id')
    end
  end
end
