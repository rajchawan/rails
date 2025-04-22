require 'rails_helper'

RSpec.describe 'Navigating to create new order pages', type: :feature do
  let!(:customer) { create(:customer) }
  let!(:restaurant) { create(:restaurant, cuisine: 0) }
  let!(:menu_item) { create(:menu_item, restaurant:) }

  before(:each) do
    sign_in customer, scope: :customer
    visit new_restaurant_order_path(restaurant)
  end

  it 'redirects to new page ' do
    expect(page).to have_content(restaurant.name)
  end

  it 'redirects to new page and checks if the menu item is there' do
    expect(page).to have_content(menu_item.items)
  end

  it 'redirects to new page and checks if there in time field' do
    expect(page).to have_content('Scheduled time')
  end

  context 'When user wants to create an order' do

    subject do
      click_button 'Add order'
    end

    it 'fills the data expect page to have success message' do
      subject
      expect(page).to have_content('Order placed successfully!')
    end

    it 'expect page to have current path show order detail page' do
      subject
      expect(page).to have_content('Order Details')
    end
  end
end


