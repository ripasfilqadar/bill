class DocumentController < ApplicationController
	def index
		authorize :Home
	end

	def show
		authorize :Document
	end

	def new
		authorize :Document
		@categories = Category.all.to_a
		
		@document = Document.new
	end

	def create
		authorize :Document
		@document = Document.new
		if condition
			
		else
			
		end
	end

	def delete
		authorize :Document
		
	end
end
