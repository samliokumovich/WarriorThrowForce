class User < ApplicationRecord
  has_many :posts


  has_secure_password

  validates :username, presence:true,
  uniqueness: {case_sensitive: false},
   length: { minimum: 3, maximum: 25 }

#format for validating , http://rubular.com/
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, presence: true,
   uniqueness: {case_sensitive: false},
   length: { maximum: 105 },
   format: { with: VALID_EMAIL_REGEX }
end
