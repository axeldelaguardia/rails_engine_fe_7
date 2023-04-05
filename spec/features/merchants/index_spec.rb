require "rails_helper"

RSpec.describe "Merchant Index Page" do
	describe "As a visitor", :vcr do
		it "I see the name of each merchant in the system" do
			visit merchants_path

			expect(page).to have_content("Merchants:")
			expect(page).to have_content("Merchant 1")
			expect(page).to have_content("Merchant 2")
		end
	end
end