class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def disable
    @product = Product.find(params[:id])
    @product.is_enabled = !@product.is_enabled
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path
    end
  end

  def create
    @product = Product.create(params[:product])
    @product.is_enabled = true
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
      @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end
    
end