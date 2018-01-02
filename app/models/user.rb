class User < ApplicationRecord
  has_one :calendar
  has_many :locations

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true

  def sort_by_date
    self.calendar.events.sort { |a, b| a.start_time.to_date <=> b.start_time.to_date }
  end

  def today_events
    self.calendar.events.select { |event| event.start_time.to_date == Date.today }
  end
end
