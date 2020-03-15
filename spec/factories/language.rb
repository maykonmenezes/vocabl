FactoryBot.define do
  factory :language do
    name { 'English' }

    trait :portuguese do
      name { 'Portuguese' }
    end
  end
end
