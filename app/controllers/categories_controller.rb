class CategoriesController < ApplicationController
	before_action :set_category, except: [:index, :new, :create]

	def index
		@categories = Category.all

	end

	def show
		
	
	end

	def new
		@category = Category.new
	end

	def create
		#require 'pry';binding.pry
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = 'Category has been created'
			redirect_to @category
		else
			flash[:danger] = 'Category has not been created'
			render :new
		end
		
	end

	def edit
		
	end

	def update
		
		if @category.update(category_params)
			flash[:success] = 'Category has been updated'
			redirect_to @category
		else
			flash[:danger] = 'Category has not been updated'
			render :edit
		end
	end

	def destroy
		if @category.destroy
			flash[:success] = 'Category has been deleted'
			redirect_to categories_path
		end
	end


	private

	def category_params
		params.require(:category).permit(:category)
		
	end

	def set_category
		#factored this line out of the following methods - show, edit, update, destroy
		#this method runs in the before_action
		@category = Category.find(params[:id])
	end


end
