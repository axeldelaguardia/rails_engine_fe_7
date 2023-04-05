require "rails_helper"

RSpec.describe "Rails Engine Service" do
	describe "endpoints", :vcr do
		describe "merchants" do
			let(:merchants) { RailsEngineService.new.merchants }

			it "returns a parsed json object" do
				expect(merchants).to be_a Hash
				expect(merchants).to have_key(:data)
				expect(merchants[:data]).to be_an Array
			end

			it "has keys" do
				merchants[:data].each do |merchant|
					expect(merchant.keys).to include(:attributes, :id, :type)

					expect(merchant[:attributes]).to be_a Hash
					expect(merchant[:id]).to be_a String

					expect(merchant[:type]).to be_a String
					expect(merchant[:type]).to eq("merchant")
				end
			end

			it "has attributes" do
				merchants[:data].each do |merchant|
					expect(merchant[:attributes]).to have_key(:name)
					expect(merchant[:attributes][:name]).to be_a String
				end
			end
		end

		describe "merchant" do
			let(:merchant) { RailsEngineService.new.merchant(1) }

			it "returns a merchant" do
				expect(merchant).to be_a Hash
				expect(merchant).to have_key(:data)
				expect(merchant[:data]).to be_a Hash

				expect(merchant[:data].keys).to match([:id, :type, :attributes])

				expect(merchant[:data][:id]).to be_a String
				expect(merchant[:data][:id]).to eq("1")

				expect(merchant[:data][:type]).to be_a String
				expect(merchant[:data][:type]).to eq("merchant")

				expect(merchant[:data][:attributes]).to have_key(:name)
				expect(merchant[:data][:attributes][:name]).to be_a String
			end
		end

		describe "merchant items" do
			let(:items) {
				RailsEngineService.new.merchant_items(1)
			}

			it "returns all items for a merchant" do
				expect(items).to be_a Hash
				expect(items).to have_key(:data)
				expect(items[:data]).to be_an Array

				items[:data].each do |item|
					expect(item.keys).to match([:id, :type, :attributes])

					expect(item[:id]).to be_a String

					expect(item[:type]).to be_a String
					expect(item[:type]).to eq("item")

					expect(item[:attributes]).to be_a Hash
					expect(item[:attributes].keys).to match([:name, :description, :unit_price, :merchant_id])

					expect(item[:attributes][:name]).to be_a String
					expect(item[:attributes][:description]).to be_a String
					expect(item[:attributes][:unit_price]).to be_a Float
					expect(item[:attributes][:merchant_id]).to be_an Integer
				end
			end
		end
	end
end