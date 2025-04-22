# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'checking all model validations', type: :model do
  let(:customer) { build(:customer) }

  context 'when given valid attributes' do
    it 'is valid with all required attributes' do
      expect(customer).to be_valid
    end
  end

  context 'when given invalid attributes' do

    it 'is invalid without a first_name' do
      customer.first_name = nil
      expect(customer).not_to be_valid
    end

    it 'is invalid when name is not in characters' do
      customer.first_name = 'xyz12'
      expect(customer).not_to be_valid
    end

    it 'is invalid without a last_name' do
      customer.last_name = nil
      expect(customer).not_to be_valid
    end

    it 'is invalid when name is not in characters' do
      customer.last_name = 'xyz12'
      expect(customer).not_to be_valid
    end

    it 'is invalid without an email' do
      customer.email = nil
      expect(customer).not_to be_valid
    end

    it 'is invalid without an age' do
      customer.age = nil
      expect(customer).not_to be_valid
    end

    it 'is invalid with an negative age' do
      customer.age = -1
      expect(customer).not_to be_valid
    end

    it 'is invalid without a date_of_birth' do
      customer.date_of_birth = nil
      expect(customer).not_to be_valid
    end

    it 'is invalid when a future date_of_birth is given' do
      customer.date_of_birth = '2025-12-12'
      expect(customer).not_to be_valid
    end

    it 'is invalid without a password' do
      customer.password = nil
      expect(customer).not_to be_valid
    end
  end
end
