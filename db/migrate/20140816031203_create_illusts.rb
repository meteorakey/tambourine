class CreateIllusts < ActiveRecord::Migration
  def change
    create_table :illusts do |t|
      t.string :url
      t.integer :width
      t.integer :height
      t.timestamps
    end
  end
end
