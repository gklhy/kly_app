#encoding=utf-8
require 'spec_helper'

describe "StaticPages" do
  describe "首页" do
    subject { page }
    before { visit root_path }
    it { should have_content('首页')}
  end
end

