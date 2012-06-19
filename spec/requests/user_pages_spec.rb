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

end
