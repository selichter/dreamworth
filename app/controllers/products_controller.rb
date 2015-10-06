class ProductsController < ApplicationController
	before_action :set_product, except: [:index, :new, :create]

	def index
		@products = Product.all

	end

	def show
		
		#require 'pry';binding.pry
	end

	def new
		@product = Product.new
	end

	def create
		#require 'pry';binding.pry
		@product = Product.new(product_params)
		if @product.save
			flash[:success] = 'Product has been created'
			redirect_to @product
		else
			flash[:danger] = 'Product has not been created'
			render :new
		end
		
	end

	def edit
		
	end

	def update
		
		if @product.update(product_params)
			flash[:success] = 'Product has been updated'
			redirect_to @product
		else
			flash[:danger] = 'Product has not been updated'
			render :edit
		end
	end

	def destroy
		if @product.destroy
			flash[:success] = 'Product has been deleted'
			redirect_to products_path
		end
	end


	private

	def product_params
		params.require(:product).permit(:title, :price, :description, :image)
		
	end

	def set_product
		#factored this line out of the following methods - show, edit, update, destroy
		#this method runs in the before_action
		@product = Product.find(params[:id])
	end


end



