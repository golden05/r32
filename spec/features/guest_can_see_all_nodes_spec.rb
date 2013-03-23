#coding: utf-8
require "spec_helper"

feature '访问者希望看到所有供应商' do

  background do
    Vendor.delete_all
    Vendor.create name: "正章", nsh: "111", address: "shanghai"
    Vendor.create name: "光明乳业", nsh: "222", address: "shanghai"
    Vendor.create name: "青岛啤酒", nsh: "333", address: "shandong"
    Vendor.create name: "格力电器", nsh: "444", address: "xiamen"
    @vendor1 = Vendor.first
    visit vendors_path
  end

  scenario '访问/vendors, 应该显示所有供应商' do
    page.should have_content 'All Vendors'
    page.should have_content 'name'
    page.should have_content 'nsh'
    page.should have_content 'address'
    Vendor.all.each do |vendor|
      page.should have_content vendor.name
      page.should have_content vendor.nsh
      page.should have_content vendor.address
    end
  end

  scenario '通过/vendors, 点击new 访问 new页面' do
    click_link 'new'
    page.should have_content 'New Vendor'
  end

  scenario "通过/vendors, 点击某个vendor's名字进入显示供应商" do
    click_link '正章', href: vendor_path(@vendor1)
  end

  scenario '通过/vendors, 点选某个供应商后面的修改,进入修改页面' do
    click_link 'edit', href: edit_vendor_path(@vendor1)
  end


end
