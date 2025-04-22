require 'rails_helper'

RSpec.describe 'Navigating to show restaurant pages', type: :feature do
  let!(:customer) { create(:customer) }
  let!(:restaurant) { create(:restaurant, cuisine: 0) }

  before(:each) do
    sign_in customer, scope: :customer
    visit restaurant_path(restaurant)
  end

  it 'redirects to show page of the restaurant' do
    expect(page).to have_content('Restaurant Details')
  end

  it 'redirects to show page of the restaurant' do
    expect(page).to have_content(restaurant.name)
  end
end


