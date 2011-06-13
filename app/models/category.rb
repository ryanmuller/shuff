class Category < ActiveRecord::Base
  has_many :links
  belongs_to :user

  validates :user_id, :presence => true
  validates :name, :presence => true
end
