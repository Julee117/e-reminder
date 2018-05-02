class Location < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    [street_address, city, state, zipcode].join(", ")
  end

  def address_changed?
    street_address_changed? || city_changed? || state_changed? || zipcode_changed?
  end

  def self.most_popular
    joins(:events).group(:id).having("COUNT(*) > 1").order("COUNT(*) DESC").limit(5)
  end

  def next
    locations = Location.most_popular
    selected_loc = locations.select { |loc| loc.events.length == self.events.length && loc.id > self.id }
    if selected_loc == []
      next_location = locations.select { |loc| loc.events.length < self.events.length }.first
    else
      next_location = selected_loc.first
    end
    next_location ||= locations.first
  end

  def prev
    locations = Location.most_popular
    selected_loc = locations.select { |loc| loc.events.length == self.events.length && loc.id < self.id }
    if selected_loc == []
      prev_location = locations.select { |loc| loc.events.length > self.events.length }.last
    else
      prev_location = selected_loc.last
    end
    prev_location ||= locations.last
  end
end
