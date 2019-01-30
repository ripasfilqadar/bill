class HomeController < ApplicationController
	def index
		authorize :Home
	end
end
