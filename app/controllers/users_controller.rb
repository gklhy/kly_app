#encoding=utf-8
class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    if @user.save 
      #如果保存成功，切换到登录后的界面
      sign_in @user
      #如果保存成功，转到欢迎界面
      flash[:success] = "注册成功！欢迎来到KLY的Rails世界！"
      redirect_to @user #等价于 link_to "user", user_path
    else #如果不成功，返回注册页面 
    	render 'new' 
    end
  end
  
  def new
    @user = User.new
  end

  def show
  	 @user = User.find( params[:id] )
  end

  def edit
     @user = User.find( params[:id] )
  end
end
