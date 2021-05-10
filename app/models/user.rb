class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :reviews
  acts_as_voter
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  validates :password, password_strength: {use_dictionary: true, min_entropy: 9}

  # Return an array of words to add to the dictionary we check against.
  def my_extra_words
    ['extra', 'words', 'here', 'too']
  end
  
end
