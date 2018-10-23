# frozen_string_literal: true

class User
  include Mongoid::Document

  validates :name, length: { within: 8..25 }
  validates :phone_no, length: { is: 10 }

  # after_destroy do |user|
  #   if user.type_of_u="restaurant"
  #     restaurant = Restaurant.find_by_user_id(user.id)
  #     restaurant.destroy
  #   end
  # end

  has_one :restaurant, dependent: :delete_all
  has_many :orders, dependent: :delete_all
  has_many :carts, dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ''
  field :encrypted_password, type: String, default: ''

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Customized
  field :name, type: String
  field :phone_no, type: String
  field :home_add, type: String
  field :work_add, type: String
  field :type_of_u, type: String
  ## Trackable
  # field :sign_in_count,      type: Integer, default: 0
  # field :current_sign_in_at, type: Time
  # field :last_sign_in_at,    type: Time
  # field :current_sign_in_ip, type: String
  # field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time
  protected

  def will_save_change_to_email?
    false
  end
end
