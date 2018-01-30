class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :start_time, :end_time, :creator

  belongs_to :location
  has_many :comments
  has_many :users
end
