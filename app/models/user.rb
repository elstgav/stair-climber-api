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

  def full_name
    "#{first_name} #{last_name}"
  end

  def as_json(_options = {})
    {
      id:            id,
      full_name:     full_name,
      first_name:    first_name,
      last_name:     last_name,
      email:         email,
      home_floor:    home_floor,
      total_flights: total_flights
    }
  end
end
