class CreateMovementsTable < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.string :name
      t.string :section
    end
  end
end
