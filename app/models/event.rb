class Event < ApplicationRecord
  belongs_to :location
  has_many :notifications
  has_many :calendars, through: :notifications
end
