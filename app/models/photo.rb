class Photo < ApplicationRecord
  ACCEPTABLE_TYPES = %w[image/jpeg image/png]

  has_one_attached :file
  belongs_to :user

  validates :title, presence: true, length: { maximum: 30 }
  validates :file, presence: true
  validate :file_must_be_acceptable_type

  private

  def file_must_be_acceptable_type
    return if file.blank?
    errors.add(:file, 'は使用できないファイルです') unless ACCEPTABLE_TYPES.include?(file.blob.content_type)
  end
end
