require 'rails_helper'

RSpec.feature 'User Sign Up', type: :feature do
  let(:customer) { build(:customer) }
  subject do
    visit new_customer_registration_path
    fill_in 'First name', with: customer.first_name
    fill_in 'Last name', with: customer.last_name
    fill_in 'Email', with: customer.email
    fill_in 'Age', with: customer.age
    fill_in 'Date of birth', with: customer.date_of_birth
    fill_in 'Password', with: customer.password
    fill_in 'Password confirmation', with: customer.password_confirmation
    click_button 'Register'
  end

  context 'with all valid credentials' do

    it 'successfully signs up the user' do
      subject
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  context 'with invalid credentials User' do

    it 'fails to sign up the user when first name is nil' do
      customer.first_name = nil
      subject
      expect(page).to have_content('First name must contain only letters and lenght should be more than 2')
    end

    it 'fails to sign up the user when last name is nil' do
      customer.last_name = nil
      subject
      expect(page).to have_content('Last name must contain only letters and lenght should be more than 2')
    end

    it 'fails to sign up the user when last name is nil' do
      customer.email = nil
      subject
      expect(page).to have_content("Email can't be blank")
    end

    it 'fails to sign up the user when age is nil' do
      customer.age = nil
      subject
      expect(page).to have_content("Age must be between 1 to 100 or it cant't be blank!")
    end

    it 'fails to sign up the user when date of birt is nil' do
      customer.date_of_birth = nil
      subject
      expect(page).to have_content("Date of birth can't be blank")
    end

    it 'fails to sign up the user when password is nil' do
      customer.password = nil
      subject
      expect(page).to have_content("Password can't be blank")
    end

    it 'fails to sign up the user when first name is not in characters' do
      customer.first_name = '1111'
      subject
      expect(page).to have_content('First name must contain only letters and lenght should be more than 2')
    end

    it 'fails to sign up the user when last name is not in characters' do
      customer.last_name = '1111'
      subject
      expect(page).to have_content('Last name must contain only letters and lenght should be more than 2')
    end

    it 'fails to sign up the user when date of birth is in the future' do
      customer.date_of_birth = '22/12/2025'
      subject
      expect(page).to have_content("Date of birth can't be in the future")
    end

    it 'fails to sign up the user when first name length is less than 2' do
      customer.first_name = 'R'
      subject
      expect(page).to have_content('First name must contain only letters and lenght should be more than 2')
    end

    it 'fails to sign up the user when last name length is less than 3' do
      customer.last_name = 'C'
      subject
      expect(page).to have_content('Last name must contain only letters and lenght should be more than 2')
    end

    it 'fails to sign up the user when age is negative' do
      customer.age = -1
      subject
      expect(page).to have_content("Age must be between 1 to 100 or it cant't be blank!")
    end

    it 'fails to sign up the user when password is short' do
      customer.password = '12'
      subject
      expect(page).to have_content('Password is too short (minimum is 6 characters)')
    end

    it 'fails to sign up the user when password confirmation does not match password' do
      customer.password_confirmation = 'wrong_password'
      subject
      expect(page).to have_content("Password confirmation doesn't match Password")
    end
  end
end