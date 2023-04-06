require "rails_helper"

RSpec.describe "Item Show Page", :vcr do
	before do
		visit item_path(4)
	end

	it "has the item's attributes" do
		expect(page).to have_content("Item Nemo Facere")
		expect(page).to have_content("Description: Sunt eum id eius magni consequuntur delectus veritatis. Quisquam laborum illo ut ab. Ducimus in est id voluptas autem.")
		expect(page).to have_content("Unit Price: 42.91")
	end
end