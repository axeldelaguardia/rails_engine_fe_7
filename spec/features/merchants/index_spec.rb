require "rails_helper"

RSpec.describe "Merchant Index Page" do
	describe "As a visitor", :vcr do
		before do
			visit merchants_path
		end
		
		it "I see the name of each merchant in the system" do
			expect(page).to have_content("Merchants:")

			within ".merchants" do
				expect(page).to have_link("Schroeder-Jerde")
				expect(page).to have_link("Klein, Rempel and Jones")
			end
		end

		it "takes us to the merchant show page" do
			click_link "Schroeder-Jerde"

			expect(current_path).to eq(merchant_path(1))
		end
	end
end