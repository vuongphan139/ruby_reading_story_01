class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :name
      t.integer :progress
      t.string :image
      t.string :content
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
