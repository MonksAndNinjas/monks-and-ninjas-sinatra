class CreateUserFitnessModalitiesTable < ActiveRecord::Migration
  def change
    create_table :user_fitness_modalities do |t|
      t.integer :user_id
      t.integer :fitness_modality_id
    end
  end
end
