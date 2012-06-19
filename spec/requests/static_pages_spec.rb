#encoding=utf-8
require 'spec_helper'

describe "静态页面" do
  describe "首页" do
    subject { page }
    before { visit root_path }
    it { should have_selector('title',text: "KLY的Rails练习") }
    it { should have_content('主页') }
  end
  
end

