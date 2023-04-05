require "rails_helper"

RSpec.describe Merchant do
	let(:merchant) {
		Merchant.new({
			id: "1",
			attributes: {
				name: "Merchant Name"
			}
		})
	}

	it "exists" do
		expect(merchant).to be_a Merchant
	end

	it "has attributes" do
		expect(merchant.id).to be(1)
		expect(merchant.name).to eq("Merchant Name")
	end
end