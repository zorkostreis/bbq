class Photo < ApplicationRecord
  belongs_to :event
  belongs_to :user
  
  has_one_attached :photo

  scope :persisted, -> { where "id IS NOT NULL" }
  
  validates :photo, presence: true
end
