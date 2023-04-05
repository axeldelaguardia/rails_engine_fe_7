class RailsEngineFacade
	def get_merchants
		merchants = service.merchants[:data]
		merchants.map do |merchant|
			Merchant.new(merchant)
		end
	end

	def get_merchant(id)
		merchant = service.merchant(id)[:data]
		Merchant.new(merchant)
	end

	def service
		RailsEngineService.new
	end
end