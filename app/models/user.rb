 #encoding=utf-8

 #可以在这个网站上实验正则表达式 http://rubular.com/

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false}
  

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
