require "rails_helper"

RSpec.describe "Rails Engine Facade", :vcr do
	let(:facade) { RailsEngineFacade.new}

	describe "get merchants" do
		it "returns an array of merchant objects from API" do
			merchants = facade.get_merchants
			expect(merchants).to be_an Array

			merchants.each do |merchant|
				expect(merchant).to be_a Merchant
				expect(merchant.id).to be_an Integer
				expect(merchant.name).to be_a String
			end
		end
	end

	describe "get merchant" do
		it "returns 1 merchant object" do
			merchant = facade.get_merchant(1)

			expect(merchant).to be_a Merchant
			expect(merchant.id).to be_an Integer
			expect(merchant.name).to be_a String
		end
	end

	describe "get merchant items" do
		it "returns all items for a specific merchant" do
			merchant_id = 1

			items = facade.get_merchant_items(merchant_id)

			expect(items).to be_an Array

			items.each do |item|
				expect(item.id).to be_an Integer
				expect(item.name).to be_a String
				expect(item.unit_price).to be_an Float
				expect(item.description).to be_a String
				expect(item.merchant_id).to be_an Integer
				expect(item.merchant_id).to eq(merchant_id)
			end
		end
	end
end