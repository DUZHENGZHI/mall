class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.belongs_to :product #自动生成product_id
      t.integer :weight, default:0#主图权重
      t.attachment :image #会生成4个image开头的字段


      t.timestamps
    end
  end
end
