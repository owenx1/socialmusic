class Post < ApplicationRecord

	mount_uploader :artwork, AvatarUploader
end
