require "rails_helper"

RSpec.describe "Root Path", :vcr do
	before do
		visit root_path
	end

	it "has a form to search for merchant" do
		expect(page).to have_field(:search)
		expect(page).to have_button("Search")
	end

	it "serches for merchant and takes us to search results" do
		fill_in :search, with: "Schroeder"
		click_button "Search"

		expect(current_path).to eq(merchant_path(1))
	end
end