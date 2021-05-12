class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password 
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  #Followed Users
  has_many :active_relationships, foreign_key: "follower_id",
                                  class_name: "Rationship",
                                  dependent: :destroy
  has_many :followed_users, through: :actice_relationships, source: :followed
  
  def following?(other_user)
      actice_relationships.find_by(followed_id: other_user.id)
  end

  def follow(other_user)
      actice_relationships.create!(followed_id: other_user.id)
  end

  def unfollow(other_user)
    actice_relationships.find_by(followed_id: other_user.id).destroy
  end
end
