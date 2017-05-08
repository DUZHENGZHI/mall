class Admin::CategoriesController < Admin::BaseController

 # 过滤器
 # 抽相同方法 only:指定哪些方法执行自定义方法
  before_action :find_root_categories, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update, :destroy]


  def index
    if params[:id].blank?
  	# roots(一级分类)是has_ancestry gem 的方法
  	# 设置分页并倒叙排序
    # 之间点击链接进来的，显示一级分类
  	@categories = Category.roots
    else
      # 取得一级分类
      @category = Category.find(params[:id])
      # 一级分类下的二级分类
      @categories = @category.children
    end
    @categories = @categories.page(params[:page] || 1).per_page(params[:per_page] || 10).order(id:"desc")


  end

  def new
    # 初始化资源
  	@category = Category.new
  end

  def create
  	#:过滤，防止批量属性攻击
  	#permit! 传来的数据都接收
  	@category = Category.new(params.require(:category).permit!)
  	if @category.save
  		flash[:notice] = "保存成功"
  		redirect_to admin_categories_path
  	else
  		render action: :new
  	end
  end

  def edit
    render action: :new
  end

  def update
    @category.attributes = params.require(:category).permit!

    if @category.save
      flash[:notice] = "修改成功"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def destroy
  if @category.destroy
    flash[:notice] = "删除成功"
    redirect_to admin_categories_path
  else
    flash[:notice] = "删除失败"
    # 重定向到来源页面
    redirect_to :back
  end
  end

  private
  def find_root_categories
    # 拿到所有一级分类,也需要一遍查询
    @root_categories = Category.roots.order(id: "desc")
  end

  def find_category
    # 查询
    @category = Category.find(params[:id])
  end


end
