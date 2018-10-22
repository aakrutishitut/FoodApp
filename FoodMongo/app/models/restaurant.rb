class Restaurant
  include Mongoid::Document

  validates_presence_of :name, :rate_for_two, :location
  validates :name, length: { within: 8..25 }
  validates_numericality_of :rate_for_two, only_integer: true
  validates_uniqueness_of :user_id

  belongs_to :user, foreign_key: :user_id
  has_many :orders, dependent: :delete_all
  has_many :menu_items, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  mount_uploader :image, ImageUploader
  field :name, type: String
  field :rate_for_two, type: String
  field :location, type: String
  field :city_id
  field :vegetarian_tag, type: String
  field :image , type: String
end
