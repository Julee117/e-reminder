class Event < ApplicationRecord
  belongs_to :location, optional: true
  has_many :notifications
  has_many :calendars, through: :notifications
  has_many :invites
  has_many :users, through: :invites

  validates :title, presence: true
  accepts_nested_attributes_for :location

  def add_date_value
    self.update_attribute(:date, self.start_time)
  end

  def update_creator(name)
    self.update_attribute(:creator, name)
  end

  def find_user
    users = User.find(self.user_ids)
  end

  def get_usernames
    find_user.map { |user| user.username }.join(", ")
  end

  def add_to_calendars
    find_user.each do |user|
      user.calendar.events << self
    end
  end
end
