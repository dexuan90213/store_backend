class ProductsController < ApplicationController

  def index
    @products = Product.available.with_attached_images
  end

  def show
    @product = Product.available.with_attached_images.find(params[:id])
  end
end
