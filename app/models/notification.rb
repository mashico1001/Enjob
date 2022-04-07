class Notification < ApplicationRecord

  belongs_to :user
  belongs_to :task

  enum kind: { warning: 1, expired: 2 }
  
 
end
