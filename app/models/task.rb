class Task < ApplicationRecord
  
  enum importance: { middle: 0, high: 1, low: 2 }
  
  belongs_to :user
  has_one :notification, dependent: :destroy
  
 
  
  validates :text, presence: true
  validates :deadline_at, presence: true
  validates :importance, presence: true
 
end
