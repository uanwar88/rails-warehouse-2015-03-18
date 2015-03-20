class ProductsController < ApplicationController
  def index
  end

  def action
    case params[:client][:action].to_i
    when 1
      @stores = Store.select("stores.id, stores.name")
      render "create"
    when 2
      render "find"
    when 3
      render "update"
    when 4
      render "delete"
    else
      render "error"
    end
  end

  def new
    product = Product.create(product_params)
    @message = "Item created successfully!"
    render "message"
  end

  def find
    @product = Product.joins(:stores).where(id: params[:item][:id]).select("products.*, stores.name AS store_name")
    render "details"
  end

  def update
    @product = Product.joins(:stores).where(id: params[:item][:id]).select("products.*, stores.name AS store_name")
    @stores = Store.select("stores.id, stores.name")
    render "edit"
  end

  def edit
    product = Product.find(params[:item][:id])
    product.update(product_params)
    @message = "Item updated successfully!"
    render "message"
  end

  def delete
    Product.delete(params[:item][:id])
    @message = "Item deleted successfully!"
    render "message"
  end

  def product_params
    params.require(:product).permit(:name, :quantity, store_ids: [])
  end


end
