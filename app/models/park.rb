class Park < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  validates :name,  presence: true, length: { maximum: 100 },
            uniqueness: true
  validates :state,  presence: true, length: { maximum: 50 }
  validates :country,  presence: true, length: { maximum: 100 }
end
