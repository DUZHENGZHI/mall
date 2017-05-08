class UsersController < ApplicationController

	# 注册表单页面
	def new
    @user = User.new

	end

    # 表单提交的页面
	def create
		@user = User.new(params.require(:user)
			.permit(:email,:password,:password_confirmation))
    @user.uuid = session[:user_uuid]
		if @user.save
			# 验证通过并存入数据库
			flash[:notice] = "注册成功"
			redirect_to new_session_path
		else
			# 验证失败返回注册页面
			render action: :new

		end


	end


end
