FactoryGirl.define do
  factory :link do
    url "https://github.com/ryggrad/Ryggrad"
    title { Faker::Lorem.words(5).join(" ") }
  end

  factory :link_invalid do
    title { Faker::Lorem.words(5).join(" ") }
  end
end
