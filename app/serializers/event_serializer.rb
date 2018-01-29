class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :start_time, :creator

  has_many :comments
end
