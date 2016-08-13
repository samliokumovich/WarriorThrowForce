class User < ApplicationRecord
  
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




   #http://www.peoplecancode.com/tutorials/users-avatars-uploading-images-using-paperclip
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing_avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
