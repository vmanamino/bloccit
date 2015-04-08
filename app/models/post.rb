class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  
  default_scope {order('created_at DESC')}
  scope :ordered_by_title, -> {unscope(:order).order('title ASC')}
  scope :ordered_by_reverse_created_at, -> {unscope(:order).order('created_at ASC')}
end
