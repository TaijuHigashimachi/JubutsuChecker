class CreateCursedItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cursed_items do |t|
      t.string :name
      t.string :youtube_id

      t.timestamps
    end
  end
end
