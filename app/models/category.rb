class Category < ActiveRecord::Base
  has_many :links
  belongs_to :user
end
