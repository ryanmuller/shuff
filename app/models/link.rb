class Link < ActiveRecord::Base
  belongs_to :category

  validates :category_id, :presence => true
  validates :url, :presence => true
end
