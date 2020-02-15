class Admin::ProductsController < ApplicationController
  before_action :authenticate_manager!
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  layout 'backend'

  def index
    @products = current_manager.products
  end

  def show
  end

  def new
    @product = Product.new
    @product.skus.build
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
    @product = current_manager.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name,
                                    :desc,
                                    :state,
                                    :original_price,
                                    :sell_price,
                                    :manager_id,
                                    images: [],
                                    skus_attributes: [
                                      :id, :spec, :quantity, :_destroy
                                    ])
  end
end
