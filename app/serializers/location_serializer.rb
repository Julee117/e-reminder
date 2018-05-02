class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state, :zipcode, :latitude, :longitude

  has_many :events
end
