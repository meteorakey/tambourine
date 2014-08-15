class CreateIllusts < ActiveRecord::Migration
  def change
    create_table :illusts do |t|
      t.string :title
      t.string :date

      t.timestamps
    end
  end
end
