class ProductsController < ApplicationController

  def create
    @product = Product.create(products_params)
    @product.category = Category.find(params[:category_id])
    @product.save

    redirect_to @product.category, notice: "Producto creado satisfactoriamente"
  end

  def destroy
    @product =Product.find(params[:id])
    @category = @product.category
    @product.destroy
    redirect_to @category, alert: 'producto eliminado'

  end

  private
  def products_params
    params.require(:product).permit(:name, :price)
  end

end
