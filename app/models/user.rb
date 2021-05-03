class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :reviews
  acts_as_voter
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  
end
