class Restaurant
  include Mongoid::Document

  validates_presence_of :name
  validates_presence_of :rate_for_two
  validates_presence_of :location
  validates :name, length: { within: 8..25 }
  validates_numericality_of :rate_for_two, only_integer: true

  belongs_to :user, foreign_key: :user_id
  has_many :orders
  has_many :menu_items
  mount_uploader :image, ImageUploader
  field :name, type: String
  field :rate_for_two, type: String
  field :location, type: String
  field :city_id, type: Integer
  field :vegetarian_tag, type: String
  field :image , type: String
end
