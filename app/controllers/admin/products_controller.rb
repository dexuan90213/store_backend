class Admin::ProductsController < ApplicationController
  before_action :authenticate_manager!
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: '商品新增成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to edit_admin_product_path(@product), notice: '商品資料已更新'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: '商品已刪除'
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,
                                    :desc,
                                    :state)
  end
end
