class SearchController < ApplicationController
	def index
		merchant = RailsEngineFacade.new.find_merchant(params[:search])
		redirect_to merchant_path(merchant.id)
	end
end