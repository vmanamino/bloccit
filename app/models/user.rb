class User < ActiveRecord::Base
   # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
  mount_uploader :avatar, AvatarUploader  
  
  has_many :posts, :autosave => true, dependent: :destroy
  has_many :comments, :autosave => true, dependent: :destroy
  has_many :votes, dependent: :destroy
 
  
  def admin?
    role == 'admin'
  end
  
  def moderator?
    role == 'moderator'
  end
  
 
  
end
