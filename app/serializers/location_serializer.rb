class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :street_address, :city, :state, :zipcode

  has_many :events
end
