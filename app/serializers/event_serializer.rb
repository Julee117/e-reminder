class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :start_time, :end_time, :note, :creator

  belongs_to :location
  has_many :comments
  has_many :users
end
