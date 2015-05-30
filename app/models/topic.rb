class Topic < ActiveRecord::Base
  
  scope :visible_to, ->(user) { user ? all : where(public: true) }
  
  has_many :posts, dependent: :destroy  
 
end
