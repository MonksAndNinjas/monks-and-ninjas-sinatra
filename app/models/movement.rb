class Movement < ActiveRecord::Base
  has_many :exercises

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
