class Review < ApplicationRecord
	belongs_to :post
	belongs_to  :parent, class_name: 'Review', optional: true
  	has_many    :replies, class_name: 'Review', foreign_key: :parent_id, dependent: :destroy
  	belongs_to :user
  	attr_accessor :user_id
  	acts_as_votable
end
