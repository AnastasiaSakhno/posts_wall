class User < ApplicationRecord
  include BCrypt
  include SecureRandom

  has_many :posts
  validates_presence_of :email, :encrypted_password, :salt

  attr_accessor :password_confirmation

  def password
    Password.new(encrypted_password)
  end

  def password=(new_password)
    self.salt = SecureRandom.hex
    self.encrypted_password = Password.create(salt + new_password)
  end
end
