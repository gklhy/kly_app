#encoding=utf-8
require 'spec_helper'

describe "UserPages" do
  describe "注册新用户" do
      subject { page }
      before { visit new_user_path }
      it { should have_selector('title',text: '注册新用户') }
  end
end
