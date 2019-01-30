class CategoryController < ApplicationController
	def index
		authorize :Category
		@categories = Category.all()
	end

	def show
		authorize :Category
		@category = Category.find_by_id(params[:id])
		if params[:parent_id].exist?
			@category_parent = Category.find_by_id(params[:parent_id])
			@category.parent = @category_parent.id
		end
	end

	def new
		authorize :Category
		@category = Category.new
	end

	def create
		authorize :Category

		@category = Category.new(resource_params)
		if @category.save
			flash[:notice] = "Kategori berhasil ditambahkan"
			redirect_to category_index_path
		else
			flash[:alert] = "Kategori gagal ditambahkan"
		end
	end

	def update
		authorize :Category
		@category = Category.find_by_id(params[:id])

		@category.update_attributes(resource_params)
		if @category.save
			flash[:notice] = 'Kategori berhasil diubah'
			redirect_to category_index_path
		else
			flash[:alert] = "Kategori gagal diubah karena #{@category.errors.message.values.join(', ')}"
		end
	end

	def edit
		authorize :Category
		@category = Category.find_by_id(params[:id])

	end

	def delete
		authorize :Category
		@category = Category.find_by_id(params[:id])
		@category.inactive!
	end

	private 

	def resource_params
		params.require(:category).permit(:name, :parent_id, :description)
	end
end
