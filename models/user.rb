class User < ActiveRecord::Base
  has_secure_password
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true
  validates :nationality, presence: true
  validates :username, presence: true
  validates :age, presence: true
end
