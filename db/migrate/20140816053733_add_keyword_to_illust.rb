class AddKeywordToIllust < ActiveRecord::Migration
  def change
    add_column :illusts, :keyword, :string
  end
end
