class OrderItemsController < ApplicationController
  before_filter :load_order

  def create
    @order_item = @order.order_items.new(quantity: 1, product_id: params[:product_id])
    if @order_item.save
      redirect_to @order, :notice => "Successfully created order item."
    else
      render action: 'new'
    end
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
    @orders = Order.all
    @order_item = OrderItem.find(params[:id])
    if @order_item.destroy
      redirect_to order_path(@order), :notice => "Successfully destroyed order item."
    else
      render action: 'edit'
    end
  end
end