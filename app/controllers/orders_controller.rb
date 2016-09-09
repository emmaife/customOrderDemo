class OrdersController < ApplicationController

	 def index
    	@orders = Order.all
  	end
	def new
		@order = Order.new
	end

	def edit
  		@order = Order.find(params[:id])
	end

	def create
		@order = Order.new(order_params)
	    @order.request = request
	    if @order.deliver
	      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
	      redirect_to @order

	    else
	      flash.now[:error] = 'Cannot send message.'
	      render :new
	    end
		#@order = Order.new(order_params)

		#if @order.save
		#	redirect_to @order
		#else
		#	render 'new'
		#end
	end


	def update

		@order = Order.find(params[:id])
		
		if @order.update(order_params)
			@newCustomOrder = Spree::Product.new(name: @order.name, price: @order.price, description: @order. description, available_on: Time.now)
			@newCustomOrder.save(validate: false) 
		  #render '/spree/admin/products/new'
		 #redirect_to  new_admin_product_path 
		  redirect_to '/store/admin/products'

		else
		  render 'edit'
		end
	end

	def show
    	@order = Order.find(params[:id])
  	end



	private
		def order_params
			params.require(:order).permit(:name, :email, :description, :price)
		end
end

