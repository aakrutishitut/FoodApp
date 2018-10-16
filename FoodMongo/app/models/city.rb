class City
  include Mongoid::Document
  validates_presence_of :name
  field :id, type: Integer
  field :name, type: String
end
