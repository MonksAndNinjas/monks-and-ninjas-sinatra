class FitnessModality < ActiveRecord::Base
  has_many :user_fitness_modalities
  has_many :users, through: :user_fitness_modalities
end
