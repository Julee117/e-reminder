class User < ApplicationRecord
  has_one :calendar, dependent: :destroy
  has_many :invites, dependent: :destroy
  has_many :events, through: :invites
  has_many :comments

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def sort_by_date
    self.calendar.events.sort { |a, b| a.start_time.to_date <=> b.start_time.to_date }
  end

  def today_events
    events = self.calendar.events.select { |event| event.start_time.to_date == Date.today }
    events.sort { |a, b| a.start_time <=> b.start_time }
  end

  def next(event)
    events = self.calendar.events.select { |day| day.start_time.to_date  == event.start_time.to_date}
    sorted_events = events.sort { |a, b| a.start_time <=> b.start_time }
    next_event = sorted_events.select { |events| events.start_time > event.start_time }.first
    next_event ||= sorted_events.first
  end
end
