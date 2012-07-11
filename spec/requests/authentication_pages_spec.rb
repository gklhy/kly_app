#encoding=utf-8
require 'spec_helper'

describe "验证" do
   subject { page }
   describe "登录页面" do
      before { visit signin_path }
      it { should have_selector('title', text: '登录') }
      it { should have_selector('h1', text: '登录') }
      it { should have_selector('div.alert.alert-error',text: '用户名或者密码不正确！')}

      describe "输入正确的登录信息" do
         let(:user) { Factory.create(:user) }
         before do
            fill_in "Email", with: user.email
            fill_in "密码", with: user.password
            click_button "登录"
         end
         it { should have_selector('title', text: user.name) }
         it { should have_link('个人信息', href: user_path(:user)) }
         it { should have_link('退出', href: signout_path) }
         it { should_not have_link('登录', href: signin_path) }

         describe "点击'退出'按钮之后" do
            before { click_link '退出'}
            it { should have_link('登录') }
         end
      end
      describe "跳转到其他的页面" do
         before { click_link "主页"}
         it { should_not have_selector('div.alert.alert-error')}
      end
   end

end
