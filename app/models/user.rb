class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :user_fitness_modalities
  has_many :fitness_modalities, through: :user_fitness_modalities

  include Slugify::InstanceMethods
  extend Slugify::ClassMethods
end
