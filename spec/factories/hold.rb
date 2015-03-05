FactoryGirl.define do
  factory :hold do
    name { Faker::Lorem.words(5).join(" ") }
  end
end
