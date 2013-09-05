class Comment < ActiveRecord::Base
  attr_accessible :body, :title, :topic, :image, :post
  belongs_to :post
  belongs_to :user

  default_scope order('created_at DESC')

  
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true 
end
