class CreateCursedItemObjectiveNames < ActiveRecord::Migration[6.1]
  def change
    create_table :cursed_item_objective_names do |t|
      t.integer :cursed_item_id
      t.integer :object_name_id

      t.timestamps
    end
  end
end
