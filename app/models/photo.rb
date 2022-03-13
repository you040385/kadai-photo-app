class Photo < ApplicationRecord
  has_one_attached :file
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :file, presence: true
end
