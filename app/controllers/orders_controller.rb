class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def edit
  		@order = Order.find(params[:id])
	end

	def create
		@order = Order.new(order_params)

		if @order.save
			redirect_to @order
		else
			render 'new'
		end
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
		  redirect_to @order
		else
		  render 'edit'
		end
	end

	def show
    	@order = Order.find(params[:id])
  	end

  	def index
    	@orders = Order.all
  	end

	private
		def order_params
			params.require(:order).permit(:name, :email, :description, :price)
		end
end

