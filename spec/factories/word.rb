FactoryBot.define do
  factory :word do
    content { ContemporaryWords.all.sample }
    language
    user

    trait :with_translations do
      after(:create) do |word|
        word.translations << create_list(:word, 2)
      end
    end
  end
end
