require "rails_helper"

RSpec.describe "Items Index Page", :vcr do
	before do
		visit items_path
	end

	it "has all items" do
		expect(page).to have_content("All Items:")

		within ".items" do
			expect(page).to have_link("Item Nemo Facere")
			expect(page).to have_link("Item Provident At")
			expect(page).to have_link("Item Repellendus Harum")
		end
	end
end