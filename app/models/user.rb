class User < ApplicationRecord
  include BCrypt
  include SecureRandom

  has_many :posts
  validates_presence_of :email, :encrypted_password, :salt
  before_validation -> (user) { user.password = SecureRandom.hex(8) }

  attr_accessor :password_confirmation

  def password
    Password.new(encrypted_password)
  end

  def password=(new_password)
    self.salt = SecureRandom.hex(8)
    self.encrypted_password = Password.create(salt + new_password)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
