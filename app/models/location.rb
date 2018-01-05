class Location < ApplicationRecord
  has_many :events, dependent: :destroy

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true

  def self.most_popular
    joins(:events).group(:id).having("COUNT(*) > 1").order("COUNT(*) DESC").limit(5)
  end
end
