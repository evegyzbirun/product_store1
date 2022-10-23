class ProductsController < ApplicationController
  def index
    @products = Product.all
    render :index
  end

  def new
    @products = Product.new
    render :new
  end

  def create
    @products = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

end