FactoryGirl.define do
  factory :group do
    name                         { Faker::HarryPotter.location }
  end
end
