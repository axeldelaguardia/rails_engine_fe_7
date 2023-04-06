class RailsEngineService
	def merchants
		get_url("/api/v1/merchants")
	end

	def merchant(id)
		get_url("/api/v1/merchants/#{id}")
	end

	def merchant_items(id)
		get_url("/api/v1/merchants/#{id}/items")
	end

	def item(id)
		get_url("/api/v1/items/#{id}")
	end

	def items
		get_url("/api/v1/items")
	end

	def find_merchant(keyword)
		get_url("/api/v1/merchants/find?name=#{keyword}")
	end

	def get_url(url)
		response = conn.get(url)
		JSON.parse(response.body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: "http://localhost:3000")
	end
end