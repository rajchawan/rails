# frozen_string_literal: true

require 'faker'

module Build
  class DatabaseBuilder
    def reset_data
      MenuItem.destroy_all
      Restaurant.destroy_all
      Customer.destroy_all
    end

    def create_restaurants
      10.times do
        restaurant = FactoryBot.create(:restaurant)
        create_menuitems_for_restaurant(restaurant)
      end
      puts "Created #{Restaurant.count} restaurants"
      puts "Created #{MenuItem.count} menu items"
    end

    def create_menuitems_for_restaurant(restaurant)
      rand(1..15).times do
        FactoryBot.create(:menu_item, restaurant:)
      end
    end

    def create_customers
      10.times do
        FactoryBot.create(:customer)
      end
      puts "Created #{Customer.count} users"

      FactoryBot.create(:customer, email: 'customer@example.com', password: 'password',
                        password_confirmation: 'password')
    end

    def execute
      reset_data
      create_customers
      create_restaurants

    end

    def run
      execute
    end
  end
end