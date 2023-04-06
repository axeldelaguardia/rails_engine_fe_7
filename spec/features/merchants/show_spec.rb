require "rails_helper"

RSpec.describe "Merchant Show Page", :vcr do
	describe "has all merchant information" do
		before do
			visit merchant_path(1)
		end

		it "has the merchants name" do
			expect(page).to have_content("Schroeder-Jerde")
		end

		it "has merchant items" do
			within ".merchant-items" do
				expect(page).to have_link("Item Nemo Facere")
				expect(page).to have_link("Item Expedita Aliquam")
			end
		end

		it "takes us to the item show page" do
			click_link "Item Nemo Facere"

			expect(current_path).to eq(item_path(4))
		end
	end
end