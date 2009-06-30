class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_users
  has_many :post_views
end
