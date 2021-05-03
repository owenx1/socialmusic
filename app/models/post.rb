class Post < ApplicationRecord

	mount_uploader :artwork, AvatarUploader
	has_many :reviews
	belongs_to :user
	attr_accessor :user_id

	def self.search(search)
		if search
			post = Post.find_by(title: search)
				if post
					@posts = self.where(title: search)
				else
					@posts = Post.all
				end
		else
			@posts = Post.all
		end
	end
end
