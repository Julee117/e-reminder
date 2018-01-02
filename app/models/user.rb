class User < ApplicationRecord
  has_one :calendar
  has_many :locations

  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
end
