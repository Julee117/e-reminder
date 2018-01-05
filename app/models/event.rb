class Event < ApplicationRecord
  belongs_to :location
  has_many :notifications, dependent: :destroy
  has_many :calendars, through: :notifications
  has_many :invites, dependent: :destroy
  has_many :users, through: :invites

  validates :title, presence: true
  validates :title, uniqueness: true
  validate :end_time_is_after_start_time

  def location_attributes=(location_attributes)
    if location_id != nil
      location = Location.find_by(id: location_id)
      self.location = location
    else
      self.create_location(name: location_attributes[:name], street_address: location_attributes[:street_address], city: location_attributes[:city], state: location_attributes[:state], zipcode: location_attributes[:zipcode])
    end
  end

  def add_date_value
    self.update_attribute(:date, self.start_time)
  end

  def update_creator(name)
    self.update_attribute(:creator, name)
  end

  def add_attribute_values(name)
    add_date_value
    update_creator(name)
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

  private

  def end_time_is_after_start_time
    if end_time < start_time
      errors.add(:end_time, "cannot be before start date/time")
    end
  end
end
