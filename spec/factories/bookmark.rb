FactoryGirl.define do
  factory :bookmark do
    url "https://github.com/ryggrad/Ryggrad"
    title { Faker::Lorem.words(5).join(" ") }
  end

  factory :bookmark_invalid, class: Bookmark do
    title { Faker::Lorem.words(5).join(" ") }
  end
end
