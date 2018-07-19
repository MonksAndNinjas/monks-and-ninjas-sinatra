class CreateFitnessModalitiesTable < ActiveRecord::Migration
  def change
    create_table :fitness_modalities do |t|
      t.string :name
    end
  end
end
