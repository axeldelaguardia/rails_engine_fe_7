class MerchantsController < ApplicationController
	def index
		@facade = RailsEngineFacade.new
	end

	def show
		@facade = RailsEngineFacade.new
	end
end