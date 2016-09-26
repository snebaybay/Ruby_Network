class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy


  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  alphabet = /\A[a-zA-Z]+\z/
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :name, :presence => true, :format => {:with => alphabet }
  validates :description, :presence => true

end
