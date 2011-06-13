class User < ActiveRecord::Base
  include Clearance::User

  has_many :categories
  has_many :links
end
