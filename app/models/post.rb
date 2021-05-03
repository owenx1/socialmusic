class Post < ApplicationRecord

	mount_uploader :artwork, AvatarUploader
	has_many :reviews
	belongs_to :user
	attr_accessor :user_id
end
