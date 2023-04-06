class MerchantsController < ApplicationController
	def index
		@facade = RailsEngineFacade.new
	end

	def show
		@merchant_id = params[:id]
		@facade = RailsEngineFacade.new
	end
end