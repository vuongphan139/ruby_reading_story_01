class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :author_name
      t.string :cover_image
      t.integer :progress, default: false
      t.string :description
      t.integer :liked, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
