class OrderItemsController < ApplicationController
  before_filter :load_order

  def create
    @order.order_items.create(quantity: 1, product_id: params[:product_id])
    redirect_to @order, :notice => "Successfully created order item."
  end

  def edit
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])
    if @order_item.update_attributes(params[:order_item])
      redirect_to @order_item, :notice  => "Successfully updated order item."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @order_item = OrderItem.destroy(params[:id])
    redirect_to order_path(@order_item.order), :notice => "Successfully destroyed order item."
  end
end