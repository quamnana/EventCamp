class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

 
	has_many :organized_events, class_name: "Event", dependent: :destroy
  has_many :attendances
  has_many :attended_events, through: :attendances
  has_many :orders
  has_many :coupons

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: {minimum: 5}, uniqueness: true
  validates :first_name, :last_name, presence: true, length: {minimum: 4}

  def to_s
  	"#{username}"
  end

  def full_name
  	"#{first_name} #{last_name}"
  end
end
