FactoryGirl.define do
  factory :message do
    text { Faker::Hacker.ingverb }
    image { Faker::File.file_name }

  end
end
