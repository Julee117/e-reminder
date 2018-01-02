class User < ApplicationRecord
  has_one :calendar
  has_many :locations

  has_secure_password
  validates :username, presence: true
  validates :username, uniqueness: true
end
