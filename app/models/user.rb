class User < ApplicationRecord
  has_secure_password
  
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :username, presence: true
  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true, length: {minimum: 5}

  def authenticate_with_credentials

  end

end
