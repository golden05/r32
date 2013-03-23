#coding: utf-8
require "spec_helper"

feature "访问者希望增加一个供应商" do
  scenario '访问/vendor/new' do
    visit '/vendors/new'
    fill_in 'Name', with: '正章'
    fill_in 'Nsh', with: '111'
    fill_in 'Address', with: 'shanghai'
    click_button 'submit'
    page.should have_content '供应商已新建'
    page.should have_content '正章'
    page.should have_content '111'
    page.should have_content 'shanghai'
    click_link 'back'
  end

  scenario '通过new页面点选back 返回/vendors' do
    visit new_vendor_path
    click_link 'back'
    page.should have_content 'All Vendors'
  end
end
