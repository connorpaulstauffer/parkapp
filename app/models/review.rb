class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :park
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
