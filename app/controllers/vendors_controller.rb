#coding: utf-8
class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all()

  end

  def edit

  end

  def new
    @vendor = Vendor.new()

  end

  def create
    @vendor = Vendor.new(params[:vendor])
    if @vendor.save
      redirect_to @vendor, notice: '供应商已新建'
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
    respond_to :html
  end

  def destroy
    respond_to redirect_to vendors_path

  end

end
