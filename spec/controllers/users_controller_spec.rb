require 'rails_helper'

describe UsersController do

  context "signup" do
    it "should failed" do#失败情况测试
      post :create, params: { user: { email: 'eggman' } }
      #当注册失败的时候是不是 render了new
      expect(response).to render_template("new")
    end

    it "should success" do#成功情况测试
      post :create, params: { user: 
        { 
          email: 'eggman@example.com', 
          password: '111111', 
          password_confirmation: '111111' 
        } 
      }
      expect(response).to redirect_to(new_session_path)
    end
  end

end