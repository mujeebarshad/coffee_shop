class OrdersController < ApplicationController

	def index
		if current_user.is_customer?
			@orders = [current_user.order].compact
		else
			@orders = Order.all
		end

		respond_to do |format|
			format.html
		end
	end

  def create
    @item = Item.find(params[:item_id])
    @order = current_user.order || Order.new(user_id: current_user.id, state: Order::STATE[:drafted])
    return redirect_to items_path if [Order::STATE[:completed], Order::STATE[:pending]].include? @order.state
    order_persist = true
    order_persist = @order.save unless @order.persisted?
    if order_persist
    	item_order = ItemOrder.create(item_id: @item.id, order_id: @order.id)
    	if item_order.valid?
	    	flash[:success] = 'Item Added to Order!'
	    else
	    	flash[:notice] = 'Order Failed to Create'
	    end
    end
    redirect_to items_path
  end

  def process_order
  	@order = Order.find(params[:id])
  	@order.state = current_user.is_customer? ? Order::STATE[:pending] : Order::STATE[:completed]
  	if @order.save
  		flash[:success] = 'Order Processed!'
  	else
	    flash[:notice] = 'Order Failed to Proceed'
  	end
  	redirect_to orders_path
  end

  def remove_order
  	return redirect_to orders_path unless current_user.is_customer?

  	@order = Order.find(params[:id])
  	@order.destroy

  	redirect_to orders_path
  end

end
