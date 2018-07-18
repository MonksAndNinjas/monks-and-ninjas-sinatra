class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
