class CreateIllusts < ActiveRecord::Migration
  def change
    create_table :illusts do |t|

      t.timestamps
    end
  end
end
