#coding: utf-8
require "spec_helper"

feature 'admin希望看到所有用户' do

  scenario '访问/users,应该显示所有用户' do
    visit users_path
    page.should have_content 'All Users'
    page.should have_content 'name'
    User.delete_all
    User.create name: "张**"
    User.create name: "李**"
    visit users_path
    page.should have_content "张**"
    page.should have_content "李**"
  end

end
