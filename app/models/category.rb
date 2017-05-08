class Category < ApplicationRecord

    validates :title,presence: {message:"名称不能为空"}
    validates :title,uniqueness: {message:"名称不能重复"}

    # 删除父分类时也删除子分类
    has_ancestry orphan_strategy: :destroy

    # 分类 一对多关系 (删除分类后，所有商品也删除)
  	has_many :products, dependent: :destroy

    before_validation :correct_ancestry

    # 一级二级分类按照数据结构返回的 迭代输出 inject修改迭代的时候用 权重和排序输出
    def self.grouped_data
    self.roots.order("weight desc").inject([]) do |result, parent|
      row = []
      row << parent #一级分类
      row << parent.children.order("weight desc")
      result << row
    end
  end



    private
    def correct_ancestry
    self.ancestry = nil if self.ancestry.blank?
    end

end
