# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Team Member Sign In', type: :feature do
  let(:customer) { create(:customer ) }

  subject do
    visit new_customer_session_path
    fill_in 'Email', with: customer.email
    fill_in 'Password', with: customer.password
    click_button 'Log in'
  end

  # Customer Sign In Tests
  context 'Customers Sign In' do
    it 'Customer successfully signs in with valid details' do
      subject

      expect(page).to have_current_path('/homepage')
      expect(page).to have_content('Signed in successfully.')
    end

    it 'Customer fails to sign in without filling email and password' do

      customer.email = nil
      customer.password = nil

      subject

      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Customer fails to sign in with incorrect email' do

      customer.email = 'wrong@email.com'
      subject

      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Customer fails to sign in with incorrect password' do
      customer.password = 'wrongpassword'
      subject
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'no one can access the pages without siginng ' do
      visit restaurants_path

      expect(page).to have_current_path('/customers/sign_in')
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
