class User < ApplicationRecord
  has_secure_password
  has_many :photos

  validates :login_id, presence: true, uniqueness: true
end
