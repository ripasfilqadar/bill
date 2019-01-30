module DocumentService
	module_function
	def SaveToDB(*args) UserService::SaveToDB.new(*args).call; end
end