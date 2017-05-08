class SessionsController < ApplicationController

	# 注册表单页面
	def new


	end

    # 表单提交的页面
	def create
         # login是sorcery的方法
		if user = login(params[:email],params[:password])
			update_browser_uuid user.uuid

			# 登录成功会在模型中判断email是否存在，然后会判断数据存的密码是否一样，而且设置好对应session，登录状态保存在浏览器中了
			flash[:notice] = "登录成功"
			redirect_to root_path
		else
            flash[:notice] = "邮箱或者密码不正确"
            redirect_to new_session_path
		end

	end

	def destroy
		logout
		flash[:notice] = "退出登录"
		redirect_to root_path
	end


end
