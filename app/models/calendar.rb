class Calendar < ApplicationRecord
  belongs_to :user
  has_many :notifications
  has_many :events, through: :notifications
end
