class DocumentPolicy < ApplicationPolicy

	def index?
		user.admin?
	end

	def new?
		user.admin?
	end

	def show?
		user.admin?
	end

	def create?
		user.admin?
	end
	
	def delete?
		user.admin?
	end
	
end