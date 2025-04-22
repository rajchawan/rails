require 'rails_helper'

RSpec.describe 'Navigating to list Menu pages', type: :feature do
  let!(:customer) { create(:customer) }
  let!(:restaurant) { create(:restaurant, cuisine: 0) }
  let!(:menu_item1) { create(:menu_item, restaurant:) }
  let!(:menu_item2) { create(:menu_item, restaurant:) }

  before(:each) do
    sign_in customer, scope: :customer
    visit restaurant_menu_items_path(restaurant)
  end

  it 'redirects to a page where all restaurants are listed' do
    expect(page).to have_content('LIST OF MENU ITEMS')
  end

  context 'when sorting restaurants' do
    it 'sorts the restaurants by name in ascending order' do
      click_link 'Dishes'

      menu_items_names = page.all('tr td:nth-child(2)').map(&:text)
      expected_names = [menu_item1, menu_item2].map(&:items).sort
      expect(menu_items_names).to eq(expected_names)
    end

    it 'sorts the restaurants by ID in ascending order' do
      click_link 'ID'

      menu_item_ids = page.all('tr td:nth-child(1)').map(&:text).map(&:to_i)
      expected_ids = [menu_item1, menu_item2].map(&:id).sort
      expect(menu_item_ids).to eq(expected_ids)
    end
  end
end
