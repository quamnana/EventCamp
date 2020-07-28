class Event < ApplicationRecord
	attr_accessor :tag_list
	#searchkick
	extend FriendlyId
	friendly_id :title, use: :slugged
	
	has_many :coupons
#Association between events and user model
	belongs_to :organizer, class_name: "User", foreign_key: "user_id"
#Association between events and category model	
	belongs_to :category
#Association between events and comment model	
	has_many :comments, dependent: :destroy
#Association between events and attendance model	
	has_many :attendances, dependent: :destroy
	has_many :attendees, through: :attendances
#Association between events and like model	
	has_many :likes, dependent: :destroy
#Association between events and tagging model	
	has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings
#Validating of fields
	validates :title, presence: true, length: {minimum: 5}
	validates :venue, presence: true
	validates :location, presence: true

#Association between events and ticket model
	has_many :tickets, dependent: :destroy
	accepts_nested_attributes_for :tickets, reject_if: :all_blank, allow_destroy: true

	
#Mounting image file uploader
	mount_uploader :image, ImageUploader


	def tag_list
		tags.join(",")
	end

	def tag_list=(names)
		tag_names = names.split(",").collect {|str| str.strip.downcase}.uniq
		new_or_existing_tags = tag_names.collect {|tag_name| Tag.find_or_create_by(name: tag_name)}
		self.tags = new_or_existing_tags
	end

# Declaring likes and dislikes method
	def total_likes
		self.likes.where(like: "like").count
	end

	def total_dislikes
		self.likes.where(like: "dislike").count
	end
end
