class Topic < ActiveRecord::Base
  attr_accessible :description, :name, :public
  has_many :posts
  has_many :posts, dependent: :destroy
end
