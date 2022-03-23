class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end
  
         
  has_many :tasks, dependent: :destroy
  attachment :image
  
  enum job_status: { level1: 0, level2: 1, level3: 2, level4: 3, level5: 4, level6: 5, level7: 6, level8: 7, level9: 8, level10: 9 }
  
end
