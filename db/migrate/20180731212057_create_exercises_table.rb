class CreateExercisesTable < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :desc
      t.integer :movement_id
    end
  end
end
