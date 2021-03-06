class Category < ActiveRecord::Base
  has_many :links, :dependent => :destroy
  belongs_to :user

  validates :user_id, :presence => true
  validates :name, :presence => true
end
