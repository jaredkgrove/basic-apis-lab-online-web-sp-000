require 'rails_helper'
require 'pry'
RSpec.describe "Searching Github", type: :feature do

  it "displays the right data" do
    stubbed_request = stub_request(:get, "https://api.github.com/search/repositories").with(query: hash_including({q: "tetris+language:assembly"})).to_return(body: repository_response)

    visit '/search'
    fill_in 'query', with: "tetris+language:assembly"

    click_button "Search Github!"
    expect(page).to have_link("https://github.com/dtrupenn/Tetris", href: "https://github.com/dtrupenn/Tetris")
    expect(page).to have_content("Tetris")
    expect(page).to have_content("A C implementation of Tetris using Pennsim through LC4")
  end
end
