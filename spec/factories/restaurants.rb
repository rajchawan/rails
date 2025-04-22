FactoryBot.define do
  factory :restaurant do
    name { Faker::Restaurant.name }
    star { %i[1 2 3 4 5].sample }
    cuisine { %w[0 1 2].sample }
    openinig_time { Time.now.to_date.to_time + 9.hours }
    closing_time { Time.now.to_date.to_time + 23.hours }
    # operating_hours { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default)}
  end
end

