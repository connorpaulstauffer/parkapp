class Image < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image_file, ImageUploader
  validates :user_id, presence: true
  validates :image_file, presence: true
  validate  :image_file_size

  private

    # Validates the size of an uploaded picture.
    def image_file_size
      if image_file.size > 5.megabytes
        errors.add(:image_file, "should be less than 5MB")
      end
    end
end
