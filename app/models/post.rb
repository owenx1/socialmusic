class Post < ApplicationRecord

	mount_uploader :artwork, AvatarUploader
	has_many :reviews
	belongs_to :user
	attr_accessor :user_id
	resourcify

	def self.search(search)
		if search
			post = Post.find_by(artist: search)
				if post
					@posts = self.where(artist: search)
				else
					@posts = Post.all
				end
		else
			@posts = Post.all
		end
	end
end
