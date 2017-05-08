class OrdersController < ApplicationController

  before_action :auth_user

  def new
    fetch_home_data
    @shopping_carts = ShoppingCart.by_user_uuid(current_user.uuid)
      .order("id desc").includes([:product => [:main_product_image]])
  end



end
