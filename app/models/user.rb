class User < ActiveRecord::Base
  validates :username, presence: true
  validates_uniqueness_of :username
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
end
