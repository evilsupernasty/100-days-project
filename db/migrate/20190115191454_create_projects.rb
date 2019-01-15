class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :summary
      t.date :start
      t.string :slug
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :projects, :slug, unique: true
  end
end
