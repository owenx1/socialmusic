class Post < ApplicationRecord

	mount_uploader :artwork, AvatarUploader
	has_many :reviews
end
