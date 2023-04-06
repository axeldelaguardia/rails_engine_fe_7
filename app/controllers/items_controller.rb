class ItemsController < ApplicationController
	def index
		@facade = RailsEngineFacade.new
	end

	def show
		@item = RailsEngineFacade.new.get_item(params[:id])
	end
end