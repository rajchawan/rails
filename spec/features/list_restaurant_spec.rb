require 'rails_helper'

RSpec.describe 'Navigating to list restaurant pages', type: :feature do
  let!(:customer) { create(:customer) }
  let!(:restaurant1) { create(:restaurant, cuisine: 0) }
  let!(:restaurant2) { create(:restaurant, cuisine: 1) }
  let!(:restaurant3) { create(:restaurant, cuisine: 2) }

  before(:each) do
    sign_in customer, scope: :customer
    visit restaurants_path
  end

  it 'redirects to a page where all restaurants are listed' do
    expect(page).to have_content('LIST OF RESTAURANTS')
    expect(page).to have_button('Filter')
  end

  context 'when filtering ' do
    it 'shows only restaurants with the selected status Planned' do
      select 'Indian', from: 'q[cuisine_eq]'
      click_button 'commit'
      expect(page).to have_content(restaurant1.name)
      expect(page).not_to have_content(restaurant3.name)
    end

    it 'shows only restaurants with the selected status In Progress' do
      select 'Chinese', from: 'q[cuisine_eq]'
      click_button 'commit'
      expect(page).to have_content(restaurant2.name)
      expect(page).not_to have_content(restaurant3.name)
    end

    it 'shows only restaurants with the selected status Completed' do
      select 'Italian', from: 'q[cuisine_eq]'
      click_button 'commit'
      expect(page).to have_content(restaurant3.name)
      expect(page).not_to have_content(restaurant1.name)
    end
  end

  context 'when sorting restaurants' do
    it 'sorts the restaurants by name in ascending order' do
      click_link 'Name'

      restaurant_names = page.all('tr td:nth-child(2)').map(&:text)
      expected_names = [restaurant1, restaurant2, restaurant3].map(&:name).sort
      expect(restaurant_names).to eq(expected_names)
    end

    it 'sorts the restaurants by ID in ascending order' do
      click_link 'ID'

      restaurant_ids = page.all('tr td:nth-child(1)').map(&:text).map(&:to_i)
      expected_ids = [restaurant1, restaurant2, restaurant3].map(&:id).sort
      expect(restaurant_ids).to eq(expected_ids)
    end
  end

  context 'when filtering and sorting restaurants at the same time' do
    it 'filters according to the status and sorts the data' do
      select 'Indian', from: 'q[cuisine_eq]'
      click_button 'commit'

      within 'table.table' do
        expect(page).to have_content(restaurant1.name)
      end
    end
  end
end
