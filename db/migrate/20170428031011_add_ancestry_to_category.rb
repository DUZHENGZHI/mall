class AddAncestryToCategory < ActiveRecord::Migration[5.0]
  def change

  	add_column :categories, :ancestry, :string

    #树形上下关系
  	add_index :categories,[:ancestry] 
  end
end
