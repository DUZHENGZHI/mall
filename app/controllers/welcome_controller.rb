class WelcomeController < ApplicationController

  def index
    
    fetch_home_data
    # 查询上架的商品
    @products = Product.onshelf.page(params[:page] || 1).per_page(params[:per_page] || 12)
          .order("id desc").includes(:main_product_image)
    end

end