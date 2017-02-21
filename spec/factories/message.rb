FactoryGirl.define do
  factory :message do
    text { Faker::Hacker.ingverb }
    image { Faker::File.file_name }
    user_id    { Faker::Number.number(1) }
    group_id   { Faker::Number.number(1) }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
