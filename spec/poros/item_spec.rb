require "rails_helper"

RSpec.describe Item do
	let(:item) { 
		Item.new({
			id: 1, 
			attributes: {
				name: "item_name",
				description: "item description", 
				unit_price: 3.50,
				merchant_id: 1
				}
			})
		}

		it "exists" do
			expect(item).to be_a Item
		end

		it "has attributes" do
			expect(item.id).to eq(1)
			expect(item.name).to eq("item_name")
			expect(item.description).to eq("item description")
			expect(item.unit_price).to eq(3.50)
			expect(item.merchant_id).to eq(1)
		end
end