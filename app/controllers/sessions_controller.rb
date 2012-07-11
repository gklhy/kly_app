#encoding=utf-8
class SessionsController < ApplicationController
   def create
   	  #render 'new'
   	  user = User.find_by_email(params[:session][:email])
      if user && user.authenticate(params[:session][:password])
        #goto profile page
        sign_in user
        redirect_to user 
      else
        #goto sigin page again
        # flash[:error] = "用户名或者密码不正确！" #出现之后就去不掉了，需要用 flash.now只出现一次
        flash.now[:error] = "用户名或者密码不正确！"
        render 'new'
      end
   end
   def new 
   end
   def destroy
   end
   def index
   end
end
