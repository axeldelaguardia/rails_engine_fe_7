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

	def get_merchant_items(id)
		items = service.merchant_items(id)[:data]
		items.map do |item|
			Item.new(item)
		end
	end

	def service
		RailsEngineService.new
	end
end