#encoding=utf-8
require 'spec_helper'

describe "UserPages" do
 
   subject { page }

  describe "注册页面" do
    before { visit new_user_path }
    it { should have_selector('title', text: "KLY的Rails练习") }
    it { should have_content('注册新用户') }
  end

  describe "属性页面" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('title', text: user.name) }
    it { should have_selector('h1', text: user.name) }

  end

  describe "注册流程" do
    before { visit signup_path }
    describe "填入错误的注册信息" do
      it "不能正常的新增一个用户" do
        expect { click_button "新建账户"}.not_to change(User, :count)
      end
    end
    describe "填入正确的注册信息" do
      # 需要和label的字符串一致
      before do 
        fill_in "用户名", with: "TestUseryy"
        fill_in "Email", with: "abc@dxfdfuuud.com"
        fill_in "密码", with: "abc123"
        fill_in "确认密码", with: "abc123"
      end
        it "应该能正确新增一个用户" do
          expect do
            click_button "新建账户"
          end.to change(User, :count).by(1)
        end
    end
  end
end
