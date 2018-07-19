class UserFitnessModality < ActiveRecord::Base
  belongs_to :user
  belongs_to :fitness_modality
end
