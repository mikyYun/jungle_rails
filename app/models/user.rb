class User < ApplicationRecord
# class User < ActiveRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :username, presence: true
  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true, length: {minimum: 5}

  def self.authenticate_with_credentials(email, password)
    trimmed_email = email.strip.downcase
    user = User.find_by(email: trimmed_email)
    user && user.authenticate(password) 
  end

end
