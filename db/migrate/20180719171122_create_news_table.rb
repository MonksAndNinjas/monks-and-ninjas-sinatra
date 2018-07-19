class CreateNewsTable < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :content
    end
  end
end
